#!/usr/bin/env bash

# --- Configuration ---
# The name of the main script to be updated.
SCRIPT_NAME="termux-url-opener"
# The URL to the latest version of the main script on GitHub.
SCRIPT_URL="https://raw.githubusercontent.com/haiueom/termux-url-opener/main/$SCRIPT_NAME"
# The installation directory.
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

# Check if the main script is actually installed where we expect it.
if [ ! -f "$INSTALL_PATH" ]; then
    echo -e "${RED}[!] ERROR: Main script not found at '$INSTALL_PATH'.${NC}"
    echo -e "${YELLOW}Please run the main installation script first.${NC}"
    exit 1
fi

echo "[*] Downloading latest version to a temporary file..."
# Create a temporary file to download the new version.
TMP_FILE=$(mktemp)
if ! curl -fLo "$TMP_FILE" "$SCRIPT_URL"; then
    echo -e "${RED}[!] ERROR: Failed to download the latest script from GitHub.${NC}"
    rm -f "$TMP_FILE"
    exit 1
fi

echo "[*] Comparing with the installed version..."
# Compare the downloaded file with the currently installed one.
if diff -q "$INSTALL_PATH" "$TMP_FILE" &>/dev/null; then
    echo -e "${GREEN}[✓] You already have the latest version.${NC}"
    rm -f "$TMP_FILE"
    exit 0
fi

echo -e "${YELLOW}[+] New version found! Installing update...${NC}"
# Replace the old script with the new one.
if mv "$TMP_FILE" "$INSTALL_PATH"; then
    # Ensure the new script is executable.
    chmod +x "$INSTALL_PATH"
    echo -e "${GREEN}[✓] Update successful!${NC}"
else
    echo -e "${RED}[!] ERROR: Failed to replace the old script file.${NC}"
    # Clean up the temp file if the move fails.
    rm -f "$TMP_FILE"
    exit 1
fi

echo -e "${BLUE}--- Update Process Finished ---${NC}"
