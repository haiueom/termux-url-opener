# termux-url-opener

Simple script for download video and audio using termux.

**Features**:

-   Download using yt-dlp
-   Download using spotdl
-   Download using curl
-   Download using wget

## How to Install

### 1. Update termux pkg

```bash
pkg up -y
```

### 2. Install

```bash
curl https://raw.githubusercontent.com/haiueom/termux-url-opener/main/install.sh | bash
```

or you can just clone this repository

```bash
pkg i git -y
git clone https://github.com/haiueom/termux-url-opener
sh ~/termux-url-opener/install.sh
```

### 3. Setup Storage

Then you must run **this** to setup storage termux.

```bash
termux-setup-storage
```

### 4. Configuration

Then make yt-dlp configuration file to set default output directory or you can make your own configuration.

```bash
mkdir -p $HOME/.config/yt-dlp
echo "--no-mtime" > $HOME/.config/yt-dlp/config
echo "-o $HOME/storage/downloads/termux/%(title)s.%(ext)s" >> $HOME/.config/yt-dlp/config
```

or you can just copy if you clone this repo

```bash
mkdir -p $HOME/.config/yt-dlp
cp "$HOME/termux-url-opener/.config/yt-dlp/config" "$HOME/.config/yt-dlp/config"
```

### 5. Usage

Then you can use the script by share a url to termux or run

```bash
termux-url-opener [url]
```

## How to Update

if you want to update the script, just run **this** in your _termux app_.

```bash
sh ~/termux-url-opener/update.sh
```

or run this

```bash
curl https://raw.githubusercontent.com/haiueom/termux-url-opener/main/update.sh | bash
```
