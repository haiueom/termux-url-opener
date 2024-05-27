#!/bin/bash

green='\033[1;32m'
cyan='\033[1;36m'
white='\033[1;37m'
reset='\033[0m'
blue='\033[1;34m'
bar="$green—————————————————————————$reset"

echo -e "\n${bar}"
echo -e "${white}[${blue}#${white}] Update Termux URL Opener${reset}"
echo -e "${white}[${blue}#${white}] Script by: ${cyan}haiueom${reset}"

echo -e "${bar}"
echo -e "${white}[${green}+${white}] Cleaning previous installation${reset}"
[ -f "$HOME/bin/termux-url-opener" ] && rm -f "$HOME/bin/termux-url-opener"

echo -e "${bar}"
echo -e "${white}[${green}+${white}] Downloading termux-url-opener${reset}"
curl -o "$HOME/bin/termux-url-opener" "https://raw.githubusercontent.com/haiueom/termux-url-opener/main/termux-url-opener"
chmod +x "$HOME/bin/termux-url-opener"
termux-fix-shebang "$HOME/bin/termux-url-opener"

echo -e "${bar}"
echo -e "${white}[${green}+${white}] Update dependencies${reset}"
apt update -y && apt upgrade -y
apt install python ffmpeg wget -y
yes | pip3 install -U yt-dlp

echo -e "${bar}"
echo -e "${white}[${green}+${white}] Done!${reset}"
