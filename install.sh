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

# --- Helper Functions ---
print_header() {
    clear
    local bar="========================================="
    echo -e "${BLUE}${bar}${NC}"
    echo -e "${GREEN}[#] Installing Termux URL Opener${NC}"
    echo -e "${GREEN}[#] Script by: haiueom${NC}"
    echo -e "${BLUE}${bar}${NC}\n"
}

log_step() {
    echo -e "\n${YELLOW}--- $1 ---${NC}"
}

# --- Main Installation Logic ---
print_header

log_step "Step 1: Updating packages and installing system dependencies"
# Added rust and binutils because spotdl dependencies (like pydantic-core)
# often require them for compilation on Termux.
pkg update -y && pkg upgrade -y
pkg install python ffmpeg curl wget -y

log_step "Step 2: Installing Python packages"
# Install yt-dlp WITHOUT dependencies as requested (prevents termux errors)
pip install --no-deps -U yt-dlp

# Install spotdl WITH dependencies (it needs them to run).
# Note: This might take a while due to compilation.
pip install -U spotdl

log_step "Step 3: Downloading and installing the script"
mkdir -p "$INSTALL_DIR"
echo "Downloading script to $INSTALL_PATH..."

if curl -fLo "$INSTALL_PATH" "$SCRIPT_URL"; then
    chmod +x "$INSTALL_PATH"
else
    echo -e "${RED}[!] Failed to download script. Check internet connection.${NC}"
    exit 1
fi

echo -e "\n${GREEN}=========================================${NC}"
echo -e "${GREEN}[✓] Installation complete!${NC}"
echo "You can now use the tool by running:"
echo -e "  ${YELLOW}$SCRIPT_NAME \"<your_url>\"${NC}"
echo -e "${GREEN}=========================================${NC}"
