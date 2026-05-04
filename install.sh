#!/usr/bin/env bash

# Exit immediately if a command exits with a non-zero status.
set -e

# --- Configuration ---
INSTALL_DIR="$HOME/bin"
SCRIPT_NAME="termux-url-opener"
SCRIPT_URL="https://raw.githubusercontent.com/haiueom/termux-url-opener/main/$SCRIPT_NAME"
INSTALL_PATH="$INSTALL_DIR/$SCRIPT_NAME"

# --- Colors ---
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

print_header() {
    clear
    local bar="========================================="
    echo -e "${BLUE}${bar}${NC}"
    echo -e "${GREEN} [#] Installing Termux URL Opener${NC}"
    echo -e "${GREEN} [#] Script by: haiueom${NC}"
    echo -e "${BLUE}${bar}${NC}\n"
}

log_step() {
    echo -e "\n${YELLOW}--- $1 ---${NC}"
}

print_header

log_step "Step 1: Updating dependencies"
pkg up -y

log_step "Step 2: Installing dependencies"
pkg install python ffmpeg curl wget deno -y
pip install -U --no-deps yt-dlp yt-dlp-ejs spotdl

log_step "Step 3: Configuring script"
termux-setup-storage -y
mkdir -p "$INSTALL_DIR"

if curl -fLo "$INSTALL_PATH" "$SCRIPT_URL"; then
    chmod +x "$INSTALL_PATH"
else
    echo -e "${RED} [!] Failed, please try again.${NC}"
    exit 1
fi

echo -e "\n${GREEN}=========================================${NC}"
echo -e "${GREEN} [✓] Installation complete!${NC}"
