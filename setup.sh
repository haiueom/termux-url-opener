#!/bin/bash

echo "Installing termux-url-opener"
destination="$HOME/bin"
[ -d "$destination" ] || mkdir "$destination"
[ -f "$destination/termux-url-opener" ] && rm -f "$destination/termux-url-opener"
curl -o "$destination/termux-url-opener" "https://raw.githubusercontent.com/haiueom/termux-url-opener/main/termux-url-opener"
chmod +x "$destination/termux-url-opener"
termux-fix-shebang "$destination/termux-url-opener"

echo "Setup storage"
[ ! -d "$HOME/storage" ] || termux-setup-storage

echo "Updating termux pkg"
apt update -y && apt upgrade -y

echo "Installing dependencies"
apt install python ffmpeg -y
yes | pip3 install -U yt-dlp

echo "Configuring yt-dlp"
config_path="$HOME/.config/yt-dlp/config"
default_out_dir="$HOME/storage/downloads/termux"
[ -d "$default_out_dir" ] || mkdir -p "$default_out_dir"
[ -f "$config_path" ] || mkdir -p "$(dirname "$config_path")"
echo "--output $default_out_dir/%(title)s.%(ext)s" > "$config_path"

echo "Done!"
