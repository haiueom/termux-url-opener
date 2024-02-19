#!/bin/bash

destination="$HOME/bin"
config_path="$HOME/.config/yt-dlp"
default_out_dir="$HOME/storage/downloads/termux"

[ -d "$config_path" ] || mkdir "$config_path"
[ -f "$config_path/config" ] || rm -f "$config_path/config"

[ -d "$default_out_dir" ] || mkdir "$default_out_dir" ]

[ -d "$destination" ] || mkdir "$destination"
[ -f "$destination/termux-url-opener" ] && rm -f "$destination/termux-url-opener"

curl -o "$destination/termux-url-opener" "https://raw.githubusercontent.com/haiueom/termux-url-opener/preview/termux-url-opener"
chmod +x "$destination/termux-url-opener"
termux-fix-shebang "$destination/termux-url-opener"

echo "-o $default_out_dir" > "$config_path/config"

apt update -y
apt install python ffmpeg -y
yes | pip3 install -U pip
yes | pip3 install -U yt-dlp

termux-setup-storage
