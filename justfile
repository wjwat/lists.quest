# Read in our .env file
set dotenv-load

# Private, quiet, default recipe to run if I use plain ol' `just`
@_default:
    echo You\'ve got to pick something to run!
    echo
    just --list

# Add and commit any updated content
content:
    -just _display "Adding & committing content updates"
    git add ./content
    -git commit -m "content(auto): Updating content"

# Copy shreddit log, remove duplicates, add and commit
shreddit:
    -just _display "Updating shreddit entries"
    rm --force ./data/shreddit_log.csv
    sed '/^$/d' $SHREDDIT_LOG | awk '!a[$1]++' > ./data/shreddit_log.csv
    git add ./data/shreddit_log.csv
    -git commit -m "content(auto): Updating data (shreddit)"

# Commit content & data, then push all commits to trigger a build
deploy: content shreddit
    -just _display "Pushing to repo..."
    git push origin

# Update a MD file's frontmatter
updatefm file:
     deno --allow-read --allow-write ./tools/update_frontmatter.js "{{file}}"

@_display str:
    echo ""
    echo "=== {{str}}"