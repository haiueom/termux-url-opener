#!/usr/bin/env bash

# Exit on error
set -e

# --- Configuration ---
SCRIPT_NAME="termux-url-opener"
SCRIPT_URL="https://raw.githubusercontent.com/haiueom/termux-url-opener/main/$SCRIPT_NAME"
INSTALL_DIR="$HOME/bin"
INSTALL_PATH="$INSTALL_DIR/$SCRIPT_NAME"

# --- Colors ---
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

print_header() {
    clear
    local bar="========================================="
    echo -e "${BLUE}${bar}${NC}"
    echo -e "${GREEN} [#] Updating Termux URL Opener${NC}"
    echo -e "${GREEN} [#] Script by: haiueom${NC}"
    echo -e "${BLUE}${bar}${NC}\n"
}

log_step() {
    echo -e "\n${YELLOW}--- $1 ---${NC}"
}

print_header

log_step "Step 1: Updating dependencies"
pkg up -y

log_step "Step 2: Updating dependencies"
pkg install python ffmpeg curl wget deno -y
pip install -U --no-deps yt-dlp[default] spotdl gallery-dl

log_step "Step 3: Configuring script"
termux-setup-storage -y
mkdir -p "$INSTALL_DIR"

if [ -f "$INSTALL_PATH" ]; then
    rm -f "$INSTALL_PATH"
fi

if curl -fLo "$INSTALL_PATH" "$SCRIPT_URL"; then
    chmod +x "$INSTALL_PATH"
else
    echo -e "${RED} [!] Failed, please try again.${NC}"
    exit 1
fi

log_step "Step 4: Ensuring $INSTALL_DIR is on PATH"
PATH_LINE='export PATH="$HOME/bin:$PATH"'
SHELL_RC="$HOME/.bashrc"
if ! grep -qsF "$PATH_LINE" "$SHELL_RC"; then
    printf '\n# Added by termux-url-opener installer\n%s\n' "$PATH_LINE" >>"$SHELL_RC"
    echo -e "${GREEN} [✓] Added to $SHELL_RC${NC}"
else
    echo -e "${GREEN} [✓] Already on PATH${NC}"
fi

echo -e "\n${GREEN}=========================================${NC}"
echo -e "${GREEN} [✓] Update complete!${NC}"
