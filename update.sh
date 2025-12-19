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

# --- Main Logic ---
echo -e "${BLUE}--- Starting Update Process ---${NC}"

if [ ! -f "$INSTALL_PATH" ]; then
    echo -e "${RED}[!] ERROR: Main script not found at '$INSTALL_PATH'.${NC}"
    echo -e "${YELLOW}Please run the main installation script first.${NC}"
    exit 1
fi

echo "[*] Downloading latest version..."
TMP_FILE=$(mktemp)
if ! curl -fLo "$TMP_FILE" "$SCRIPT_URL"; then
    echo -e "${RED}[!] ERROR: Failed to download update.${NC}"
    rm -f "$TMP_FILE"
    exit 1
fi

echo "[*] Comparing versions..."
if diff -q "$INSTALL_PATH" "$TMP_FILE" &>/dev/null; then
    echo -e "${GREEN}[✓] You already have the latest version.${NC}"
    rm -f "$TMP_FILE"
    exit 0
fi

echo -e "${YELLOW}[+] New version found! Installing...${NC}"
if mv "$TMP_FILE" "$INSTALL_PATH"; then
    chmod +x "$INSTALL_PATH"
    echo -e "${GREEN}[✓] Update successful!${NC}"
else
    echo -e "${RED}[!] ERROR: Failed to replace script file.${NC}"
    rm -f "$TMP_FILE"
    exit 1
fi

echo -e "${BLUE}--- Update Process Finished ---${NC}"
