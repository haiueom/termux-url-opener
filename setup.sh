#!/bin/bash

green='\033[1;32m'
cyan='\033[1;36m'
white='\033[1;37m'
reset='\033[0m'
blue='\033[1;34m'
bar="$green—————————————————————————$reset"

clear

echo -e "\n${white}[${blue}#${white}] Install Termux URL Opener${reset}"
echo -e "${white}[${blue}#${white}] Script by: ${cyan}haiueom${reset}"

echo -e "${bar}"
echo -e "${white}[${green}+${white}] Cleaning previous installation${reset}"
[ -d "$HOME/bin" ] || mkdir "$HOME/bin"
[ -f "$HOME/bin/termux-url-opener" ] && rm -f "$HOME/bin/termux-url-opener"

echo -e "${bar}"
echo -e "${white}[${green}+${white}] Downloading termux-url-opener${reset}\n"
curl -o "$HOME/bin/termux-url-opener" "https://raw.githubusercontent.com/haiueom/termux-url-opener/main/termux-url-opener"
chmod +x "$HOME/bin/termux-url-opener"
termux-fix-shebang "$HOME/bin/termux-url-opener"

echo -e "\n${bar}"
echo -e "${white}[${green}+${white}] Installing dependencies${reset}\n"
pkg update -y && pkg upgrade -y
pkg install python ffmpeg wget -y
yes | pip install -U --no-deps yt-dlp

echo -e "\n${bar}"
echo -e "${white}[${green}✓${white}] Done!${reset}"
echo -e "${white}[${blue}!${white}] Don't forget to:${reset}"
echo -e "${white}[${blue}!${white}]   -> Run 'termux-setup-storage'${reset}"
echo -e "${white}[${blue}!${white}]   -> Configure yt-dlp config${reset}"
echo -e "${white}[${blue}!${white}]   -> Add cookie files${reset}"
