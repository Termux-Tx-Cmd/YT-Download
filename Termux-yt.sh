#!/bin/bash

# Open Developer Page
xdg-open "https://www.facebook.com/share/16JmHprSe1/" > /dev/null 2>&1

# Colors
RED='\033[1;31m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
CYAN='\033[1;36m'
NC='\033[0m'

# Banner
clear
echo -e "${CYAN}"
echo "██╗   ██╗████████╗    ██████╗ ██╗   ██╗    ████████╗██╗  ██╗"
echo "██║   ██║╚══██╔══╝    ██╔══██╗╚██╗ ██╔╝    ╚══██╔══╝██║  ██║"
echo "██║   ██║   ██║       ██████╔╝ ╚████╔╝        ██║   ███████║"
echo "██║   ██║   ██║       ██╔═══╝   ╚██╔╝         ██║   ██╔══██║"
echo "╚██████╔╝   ██║       ██║        ██║          ██║   ██║  ██║"
echo " ╚═════╝    ╚═╝       ╚═╝        ╚═╝          ╚═╝   ╚═╝  ╚═╝"
echo -e "${YELLOW}        Termux Tx Cmd | Developer: Mahim"
echo -e "${NC}"

# Install yt-dlp if not installed
if ! command -v yt-dlp > /dev/null; then
  echo -e "${YELLOW}[+] Installing yt-dlp...${NC}"
  pkg update -y && pkg install python -y
  pip install yt-dlp
fi

# Ask for URL
echo -ne "${GREEN}Enter YouTube video link: ${NC}"
read url

# Ask format
echo -e "${CYAN}\nChoose format to download:${NC}"
echo -e "${YELLOW}[1] Video (MP4)"
echo -e "[2] Audio (MP3)${NC}"
read -p "Enter choice [1/2]: " choice

# Create Downloads folder
mkdir -p ~/YT-Downloads
cd ~/YT-Downloads

# Download based on choice
if [ "$choice" == "1" ]; then
  echo -e "${GREEN}\n[✓] Downloading Video...${NC}"
  yt-dlp -f best "$url"
elif [ "$choice" == "2" ]; then
  echo -e "${GREEN}\n[✓] Downloading Audio...${NC}"
  yt-dlp --extract-audio --audio-format mp3 "$url"
else
  echo -e "${RED}[-] Invalid choice!${NC}"
fi

echo -e "${CYAN}\n[✓] Download complete. Files saved in ~/YT-Downloads/${NC}"
