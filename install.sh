#!/bin/bash

clear
echo -e "—————————————————————————"
echo -e "[#] Install Termux URL Opener"
echo -e "[#] Script by: haiueom"
echo -e "—————————————————————————"
echo -e "[+] Install dependencies\n"
pkg i python ffmpeg -y
yes | pip install -U --no-deps yt-dlp
yes | pip install -U spotdl
echo -e "—————————————————————————"
echo -e "[+] Install termux-url-opener\n"
mkdir -p "$HOME/bin"
[ -f "$HOME/bin/termux-url-opener" ] && rm -f "$HOME/bin/termux-url-opener"
curl -o "$HOME/bin/termux-url-opener" "https://raw.githubusercontent.com/haiueom/termux-url-opener/main/termux-url-opener"
chmod +x "$HOME/bin/termux-url-opener"
termux-fix-shebang "$HOME/bin/termux-url-opener"
echo -e "—————————————————————————"
echo -e "[✓] Done"
