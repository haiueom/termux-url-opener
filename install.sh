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
    echo -e "${GREEN}[#] Script by: haiueom (Improved Version)${NC}"
    echo -e "${BLUE}${bar}${NC}\n"
}

log_step() {
    echo -e "\n${YELLOW}--- $1 ---${NC}"
}

# --- Main Installation Logic ---
print_header

log_step "Step 1: Updating packages and installing system dependencies"
pkg up -y
pkg install python ffmpeg curl -y

log_step "Step 2: Installing and upgrading Python packages"
pip install --upgrade spotdl
pip install --upgrade --no-deps yt-dlp

log_step "Step 3: Downloading and installing the script"
# Ensure the installation directory exists
mkdir -p "$INSTALL_DIR"
echo "Downloading script to $INSTALL_PATH..."
# Use curl with -f (fail on error), -L (follow redirects), -o (output)
curl -fLo "$INSTALL_PATH" "$SCRIPT_URL"
# Make the script executable
chmod +x "$INSTALL_PATH"

echo -e "\n${GREEN}=========================================${NC}"
echo -e "${GREEN}[✓] Installation complete!${NC}"
echo "You can now use the tool by running:"
echo -e "  ${YELLOW}$SCRIPT_NAME \"<your_url>\"${NC}"
echo -e "${GREEN}=========================================${NC}"
