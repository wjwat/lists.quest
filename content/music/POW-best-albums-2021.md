+++
title = "Passion of the Weiss's Best Albums of 2021"
[extra]
updated = 2022-06-25T00:30:34Z
+++

{% revlist() %}
<strike>EST Gee - Bigger Than Life Or Death</strike>
<strike>Bris - Tricky Dance Moves</strike>
<strike>Pearl & The Oysters - Flowerland</strike>
<strike>Enumclaw - Jimbo Demo</strike>
<strike>Injury Reserve - By the Time I Get to Phoenix</strike>
Blockhead - Space Werewolves Will Be The End Of Us All
Dawn Richard - Second Line
Cleo Sol - Mother
Alfa Mist - Bring Backs
Ralfy The Plug - Rapper Overnight 2
Chris Crack - Sheep Hate Goats
Colleen Green - Cool
Akeem Ali - Mack In the Day Staring Keemy Casanova
The Bug - Fire
Dâm-Funk - Architecture III
Altın Gün - Yol
Aesop Rock & Blockhead - Garbology
Kiefer - When There's Love Around
Grouper - Shade
Sons of Kemet - Black To The Future
Patrick Shiroishi - Hidemi
Anz - All Hours
Doja Cat - Planet Her
Maxo Kream - WEIGHT OF THE WORLD
KA - A Martyr's Reward
BADBADNOTGOOD - Talk Memory
Burial + Blackdown - Shock Power of Love EP
Young Slo-Be - Slo-Be Bryant 3
La Luz - La Luz
Wiki - Half God
Remble - IT'S REMBLE
Faye Webster - I Know I'm Funny haha
Bruiser Wolf - Dope Game Stupid
Pink Siifu - GUMBO'!
Dean Blunt - Black Metal 2
Rochelle Jordan - Play with the Changes
Isaiah Rashad - The House Is Burning
Erika De Casier - Sensational
Unknown T - Adolescence
PinkPantheress - to hell with it
Drakeo The Ruler - So Cold I Do Em 2
Madlib - Sound Ancestors
Turnstile - GLOW ON
Tyler, the Creator - CALL ME IF YOU GET LOST
Darkside - Spiral
Armand Hammer & The Alchemist - HARAM
Mdou Moctar - Afrique Victime
Mach-Hommy - Pray For Haiti
Boldy James & The Alchemist - Bo Jackson
Floating Points, Pharoah Sanders & The London Symphony Orchestra - Promises
{% end %}

---

## Sources

<https://www.passionweiss.com/2021/12/30/the-pow-best-albums-of-2021/>

Ripped from: <https://www.albumoftheyear.org/list/1876-passion-of-the-weisss-best-albums-of-2021/>

## Code

```js
let out = []
let titles = document.querySelectorAll("meta[itemprop='name']");

for (let i = 0; i < titles.length; i++) {
  out.push(titles[i].content);
}

console.log(out.join("\n"));
```