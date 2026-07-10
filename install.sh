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
RED='\033[0;31m'
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
pip install -U --no-deps yt-dlp[default] spotdl gallery-dl

log_step "Step 3: Configuring script"
termux-setup-storage -y
mkdir -p "$INSTALL_DIR"

# Download to a temp file first so a failed/partial download never
# leaves a broken script at the install path.
TMP_FILE="$(mktemp)"
trap 'rm -f "$TMP_FILE"' EXIT

if ! curl -fLo "$TMP_FILE" "$SCRIPT_URL"; then
    echo -e "${RED} [!] Download failed, please try again.${NC}"
    exit 1
fi

if [ ! -s "$TMP_FILE" ]; then
    echo -e "${RED} [!] Downloaded file is empty. Aborting.${NC}"
    exit 1
fi

chmod +x "$TMP_FILE"
mv -f "$TMP_FILE" "$INSTALL_PATH"
trap - EXIT

log_step "Step 4: Adding $INSTALL_DIR to PATH"
PATH_LINE='export PATH="$HOME/bin:$PATH"'
SHELL_RC="$HOME/.bashrc"
if ! grep -qsF "$PATH_LINE" "$SHELL_RC"; then
    printf '\n# Added by termux-url-opener installer\n%s\n' "$PATH_LINE" >>"$SHELL_RC"
    echo -e "${GREEN} [✓] Added to $SHELL_RC${NC}"
else
    echo -e "${GREEN} [✓] Already on PATH${NC}"
fi

echo -e "\n${GREEN}=========================================${NC}"
echo -e "${GREEN} [✓] Installation complete!${NC}"
echo -e "${YELLOW} [!] Restart Termux or run: source $SHELL_RC${NC}"
echo -e "${GREEN} [#] Then run: termux-url-opener \"<url>\"${NC}"
