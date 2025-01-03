# Read in our .env file
set dotenv-load

# Private, quiet, default recipe to run if I use plain ol' `just`
@_default:
    echo Recipes for lists.quest
    echo
    just --list

# Add and commit any updated content
content:
    @just _display "Adding & committing content updates"
    git add ./content
    -git commit -m "content(auto): Updating content"

# Copy shreddit log, remove duplicates, add, and commit
shreddit:
    @just _display "Updating shreddit entries"
    rm -f ./data/shreddit_log.csv
    # Remove duplicates
    sed '/^$/d' $SHREDDIT_LOG | awk '!a[$1]++' > ./data/shreddit_log.csv
    # Filter invalid characters otherwise zola will barf
    iconv -o ./data/shreddit_log.csv -f utf-8 -t utf-8 -c ./data/shreddit_log.csv
    git add ./data/shreddit_log.csv
    -git commit -m "content(auto): Updating data (shreddit)"

# Copy games list, add, and commit
games:
    @just _display "Updating games entries"
    rm -f ./data/games.csv
    cp $GAMES_LIST ./data/games.csv
    git add ./data/games.csv
    -git commit -m "content(auto): Updating data (games)"

# Commit content & data, then push all commits to trigger a build
deploy: content shreddit
    @just _display "Pushing to repo..."
    git push origin

# Update a MD file's frontmatter
updatefm file:
    @just _display "Updating frontmatter for {{file}}"
    deno --allow-read --allow-write ./tools/update_frontmatter.js "{{file}}"

@_display str:
    echo ""
    echo "=== {{str}}"
