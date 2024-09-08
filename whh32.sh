#!/bin/bash

RED='\033[0;31m'
ORANGE='\033[0;33m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[1;35m'
RESET='\e[0m'

# My Functions
function get_ssl {
    apt update

    if command -v certbot &> /dev/null; then
        echo -e "${PURPLE}Certbot is already installed.${RESET}"
    else
        echo "Certbot is not installed. Installing Certbot..."
        sudo apt install certbot
        echo -e "${PURPLE}Certbot installation completed.${RESET}"
    fi

    read -p "Enter Your Domain: " domain
    echo "start..."
    sudo certbot certonly --manual --preferred-challenges=dns -d "*.$domain" -d "$domain"
}

function install_sanaei {
        apt update
        bash <(curl -Ls https://raw.githubusercontent.com/mhsanaei/3x-ui/master/install.sh)
}

# Display menu and header
echo -e "${ORANGE}
            __       __       ______    _____  
           [  |     [  |     / ____ \`. / ___ \`.
 _   _   __ | |--.   | |--.  \`'  __) ||_/___) |
[ \\ [ \\ [  ]| .-. |  | .-. | _  |__ '. .'____.'
 \\ \\/\\ \\/ / | | | |  | | | || \\____) |/ /_____ 
  \\__/\\__/ [___]|__][___]|__]\\______.'|_______|
${RESET}"
echo -e "${BLUE}Please choose an option:"
echo -e "       1. Get SSL For Your Domain And Subdomains"
echo -e "       2. Install Sanaei Panel"
echo -e "${RESET}"

# Read user input
read -p "Enter your choice: " choice
echo "..........................................."

# Get Input
case $choice in
    1)
        get_ssl
        ;;
    2)
        install_sanaei
        ;;
    *)
        echo "Invalid option. Please choose correct option."
        ;;
esac
