# Termux URL Opener

A versatile command-line tool for Termux that simplifies downloading content from URLs. Whether you need to grab a video, extract audio, or just download a file, this script provides a simple menu to handle it all with popular tools like `yt-dlp`, `spotdl`, `curl`, and `wget`.

## Features

-   **All-in-One Menu**: A simple, interactive menu to choose your download method.
-   **Video & Audio Downloads**: Easily download videos as MP4 or MKV, or extract audio as MP3/AAC from various sites using `yt-dlp`.
-   **Video Resolution Choice**: When downloading MP4 or MKV, choose from best available, 1080p, 720p, 480p, 360p, or enter a custom `yt-dlp` format/max-height value.
-   **Spotify Support**: Download tracks from Spotify URLs using `spotdl`.
-   **Gallery Downloads**: Grab image galleries and albums from many sites using `gallery-dl`.
-   **Standard Downloads**: Use `curl` or `wget` for direct file downloads.
-   **Organized Storage**: Files are automatically saved into organized subdirectories within `~/storage/downloads/termux`.

## Prerequisites

Before you begin, ensure you have Termux installed on your Android device. The script will attempt to install the following if missing:

-   `python`
-   `ffmpeg`
-   `curl`
-   `wget`
-   `deno`
-   `yt-dlp[default]` (Python package)
-   `spotdl` (Python package)
-   `gallery-dl` (Python package)

## Installation

You can install the tool with a single command. Open your Termux terminal and run the following:

```bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/haiueom/termux-url-opener/main/install.sh)"
```

This command will:

1. Update your package lists and upgrade existing packages.
2. Install all the necessary system and Python dependencies.
3. Download the main termux-url-opener script to ~/bin.
4. Make the script executable.
5. Add `~/bin` to your `PATH` (in `~/.bashrc`) so you can run `termux-url-opener` from anywhere.

> After installation, restart Termux or run `source ~/.bashrc` for the `PATH` change to take effect.

## Updating

To update to the latest version, run:

```bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/haiueom/termux-url-opener/main/update.sh)"
```

This command will:

1. Update your package lists and upgrade installed packages.
2. Upgrade the Python dependencies (`yt-dlp`, `spotdl`, `gallery-dl`).
3. Download the latest `termux-url-opener` script into `~/bin`.
4. Ensure `~/bin` is on your `PATH`.

The update is safe: the new script is downloaded to a temporary file and only replaces your current one once the download succeeds. Your previous version is kept as `~/bin/termux-url-opener.bak`, so you can roll back if needed:

```bash
mv ~/bin/termux-url-opener.bak ~/bin/termux-url-opener
```

## Usage
Once installed, you can share an URL to Termux App or use the command line to run the script.

### Method 1: Share a URL to Termux:

Use the share feature from your browser or any app that supports sharing URLs.

Select "Termux" from the list of apps. This script will launch automatically if configured correctly in ~/bin/termux-url-opener.

### Method 2: Run the script directly from the command line:

Open Termux and type the following command:

```bash
termux-url-opener "https://www.youtube.com/watch?v=dQw4w9WgXcQ"
```

After the URL is accepted, choose MP4 or MKV in the menu and pick a resolution option when prompted.

## Contributing
Contributions are welcome! If you have ideas for new features, improvements, or bug fixes, feel free to open an issue or submit a pull request.
