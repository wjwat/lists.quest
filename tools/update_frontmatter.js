import { extractToml } from "jsr:@std/front-matter@1.0.5";
import { parse, stringify } from "jsr:@std/toml@1.0.2";
import { format } from "jsr:@std/datetime@0.225.2";

const stats = await Deno.stat(Deno.args[0]);
const text = await Deno.readTextFile(Deno.args[0]);
const frontMatter = extractToml(text);
const frontMatterObj = parse(frontMatter.frontMatter);

const date = frontMatterObj.extra?.date !== undefined
  ? {}
  : { date: format(stats.birthtime, "yyyy-MM-ddTHH:mm:ssZ", { timeZone: "UTC" }) };

frontMatterObj.extra = {
  ...(frontMatterObj.extra ?? {}),
  ...date,
  updated: format(stats.mtime, "yyyy-MM-ddTHH:mm:ssZ", { timeZone: "UTC" })
}

const updatedFile = text.replace(frontMatter.frontMatter + '\n', stringify(frontMatterObj));

await Deno.writeTextFile(Deno.args[0], updatedFile);