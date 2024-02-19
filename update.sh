#!/bin/bash

destination="$HOME/bin"

[ -d "$destination" ] || mkdir "$destination"
[ -f "$destination/termux-url-opener" ] && rm -f "$destination/termux-url-opener"

curl -o "$destination/termux-url-opener" "https://raw.githubusercontent.com/haiueom/termux-url-opener/preview/termux-url-opener"
chmod +x "$destination/termux-url-opener"
termux-fix-shebang "$destination/termux-url-opener"

echo "Done"
