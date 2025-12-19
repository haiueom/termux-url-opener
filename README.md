# Termux URL Opener

A versatile command-line tool for Termux that simplifies downloading content from URLs. Whether you need to grab a video, extract audio, or just download a file, this script provides a simple menu to handle it all with popular tools like `yt-dlp`, `spotdl`, `curl`, and `wget`.

## Features

-   **All-in-One Menu**: A simple, interactive menu to choose your download method.
-   **Video & Audio Downloads**: Easily download videos as MP4 or extract audio as MP3 from various sites using `yt-dlp`.
-   **Spotify Support**: Download tracks from Spotify URLs using `spotdl`.
-   **Standard Downloads**: Use `curl` or `wget` for direct file downloads.
-   **Organized Storage**: Files are automatically saved into organized subdirectories within `~/storage/downloads/termux`.
-   **Self-Updating**: Includes a built-in command to update the script to the latest version directly from GitHub.
-   **Auto-Dependency Installation**: The script automatically detects and attempts to install missing dependencies.

## Prerequisites

Before you begin, ensure you have Termux installed on your Android device. The script will attempt to install the following if missing:

-   `python`
-   `ffmpeg`
-   `curl`
-   `wget`
-   `yt-dlp` (Python package)
-   `spotdl` (Python package)

## Installation

You can install the tool with a single command. Open your Termux terminal and run the following:

```bash
bash -c "$(curl -fsSL [https://raw.githubusercontent.com/haiueom/termux-url-opener/main/install.sh](https://raw.githubusercontent.com/haiueom/termux-url-opener/main/install.sh))"
```

This command will:

1. Update your package lists and upgrade existing packages.
2. Install all the necessary system and Python dependencies.
3. Download the main termux-url-opener script to ~/bin.
4. Make the script executable.

## Usage
Once installed, you can share an URL to Termux App or use the command line to run the script.

### Method 1: Share a URL to Termux:

Use the share feature from your browser or any app that supports sharing URLs.

Select "Termux" from the list of apps. This script will launch automatically if configured correctly in ~/bin/termux-url-opener.

### Method 2: Run the script directly from the command line:

Open Termux and type the following command:

```bash
termux-url-opener "[https://www.youtube.com/watch?v=dQw4w9WgXcQ](https://www.youtube.com/watch?v=dQw4w9WgXcQ)"
```
## Contributing
Contributions are welcome! If you have ideas for new features, improvements, or bug fixes, feel free to open an issue or submit a pull request.
