# termux-url-opener

Simple script for download video and audio using termux.

**Features**:

-   download using yt-dlp
-   download using curl
-   download using wget

## How to Install

Run **this** in your _termux app_.

```bash
pkg update -y && pkg upgrade -y
pkg install curl -y && curl https://raw.githubusercontent.com/haiueom/termux-url-opener/main/setup.sh | bash
```

Then you must run **this** to setup storage termux.

```bash
termux-setup-storage
```

Then make yt-dlp configuration file to set default output directory or you can make your own configuration.

```bash
mkdir -p ~/.config/yt-dlp
echo "--no-mtime" > ~/.config/yt-dlp/config
echo "-o $HOME/storage/shared/Download/termux/%(title)s.%(ext)s" >> ~/.config/yt-dlp/config
```

Then you can use the script by share a link to termux or run **this** in your _termux app_.

```bash
termux-url-opener <url>
```

## How to Update

if you want to update the script, just run **this** in your _termux app_.

```bash
curl https://raw.githubusercontent.com/haiueom/termux-url-opener/main/update.sh | bash
```
