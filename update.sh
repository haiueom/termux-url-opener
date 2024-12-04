#!/bin/bash

clear
echo -e "—————————————————————————"
echo -e "[#] Update Termux URL Opener"
echo -e "[#] Script by: haiueom"
echo -e "—————————————————————————"
echo -e "[+] Cleaning previous installation\n"
[ -f "$HOME/bin/termux-url-opener" ] && rm -f "$HOME/bin/termux-url-opener"
echo -e "—————————————————————————"
echo -e "[+] Update dependencies\n"
pkg i python ffmpeg -y
yes | pip install -U --no-deps yt-dlp
yes | pip install -U setuptools
python -m pip install -U pydantic --extra-index-url https://termux-user-repository.github.io/pypi/
yes | pip install -U spotdl
echo -e "—————————————————————————"
echo -e "[+] Update termux-url-opener\n"
curl -o "$HOME/bin/termux-url-opener" "https://raw.githubusercontent.com/haiueom/termux-url-opener/main/termux-url-opener"
chmod +x "$HOME/bin/termux-url-opener"
echo -e "—————————————————————————"
echo -e "[✓] Done"
