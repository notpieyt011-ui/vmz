#!/usr/bin/env bash
# ===================================================
# PTERODACTYL HOSTING MANAGER - NEXT GEN ULTRA EDITION
# 2025 Edition
# ===================================================
# Original Creator: MahimOp
# YouTube : https://www.youtube.com/@mahimxyz
# Discord : https://discord.gg/zkDNdPpArS
# ===================================================
set -e
# Next-Gen Neon Color Theme
RESET="\e[0m"
BOLD="\e[1m"
DIM="\e[2m"
UNDERLINE="\e[4m"
CYAN="\e[96m"
BLUE="\e[94m"
PURPLE="\e[95m"
GREEN="\e[92m"
YELLOW="\e[93m"
RED="\e[91m"
WHITE="\e[97m"
NEON_GREEN="\e[38;5;82m"
NEON_PURPLE="\e[38;5;165m"
DANGER="\e[38;5;75m"
GLOW="\e[38;5;51m"
DANGER="\e[38;5;196m"
clear
# Epic Welcome Animation Header
welcome_banner() {
    clear
    echo -e "${DANGER}"
    cat << "EOF"
 ___      ___       __       __    __   __     ___      ___ 
|"  \    /"  |     /""\     /" |  | "\ |" \   |"  \    /"  |
 \   \  //   |    /    \   (:  (__)  :)||  |   \   \  //   |
 /\\  \/.    |   /' /\  \   \/      \/ |:  |   /\\  \/.    |
|: \.        |  //  __'  \  //  __  \\ |.  |  |: \.        |
|.  \    /:  | /   /  \\  \(:  (  )  :)/\  |\ |.  \    /:  |
|___|\__/|___|(___/    \___)\__|  |__/(__\_|_)|___|\__/|___|
   
EOF
    echo -e "${NEON_PURPLE}${BOLD} NEXT GEN ULTRA EDITION - 2025${RESET}"
    echo -e "${GLOW} Ultimate Pterodactyl Control Center${RESET}"
    echo -e "${DIM} Original Creator: ${BOLD}MahimOp${RESET} ${DIM}| YouTube: @mahimxyz${RESET}"
    echo -e "${DIM} Discord: https://discord.gg/zkDNdPpArS${RESET}"
    echo -e "${DANGER}══════════════════════════════════════════════════════════${RESET}\n"
    sleep 1.5
}
# Utility Functions
progress() { echo -e "${NEON_GREEN}${BOLD}➤ $1${RESET}"; }
success() { echo -e "${GREEN}${BOLD}✓ $1${RESET}"; }
warning() { echo -e "${YELLOW}${BOLD}! $1${RESET}"; }
error() { echo -e "${RED}${BOLD}✘ $1${RESET}"; }
print_box_header() {
    local text="$1"
    local color="${2:-$NEON_PURPLE}"
    echo -e "${color}${BOLD}╔══════════════════════════════════════════════════════════╗${RESET}"
    echo -e "${color}${BOLD}║${RESET} ${WHITE}${BOLD}$text$(printf '%*s' $((58 - ${#text})) '') ${color}${BOLD}║${RESET}"
    echo -e "${color}${BOLD}╚══════════════════════════════════════════════════════════╝${RESET}\n"
}
print_menu_option() {
    local num="$1"
    local text="$2"
    echo -e "${DANGER} ┌──────────────────────────────────────────────────────┐${RESET}"
    echo -e "${DANGER} │${RESET} ${WHITE}${BOLD}[${NEON_GREEN}${num}${WHITE}]${RESET} ${CYAN}${text}$(printf '%*s' $((48 - ${#text} - 3)) '') ${DANGER}│${RESET}"
    echo -e "${DANGER} └──────────────────────────────────────────────────────┘${RESET}"
}
# Remote Script Runner
run_remote_script() {
    local url="$1"
    local name="$2"
    clear
    echo -e "${NEON_PURPLE}"
    cat << "EOF"
 ___      ___       __       __    __   __     ___      ___ 
|"  \    /"  |     /""\     /" |  | "\ |" \   |"  \    /"  |
 \   \  //   |    /    \   (:  (__)  :)||  |   \   \  //   |
 /\\  \/.    |   /' /\  \   \/      \/ |:  |   /\\  \/.    |
|: \.        |  //  __'  \  //  __  \\ |.  |  |: \.        |
|.  \    /:  | /   /  \\  \(:  (  )  :)/\  |\ |.  \    /:  |
|___|\__/|___|(___/    \___)\__|  |__/(__\_|_)|___|\__/|___|
                             
EOF
    print_box_header "$name" $NEON_PURPLE
    progress "Downloading and executing remote script..."
    local temp_script=$(mktemp)
    if curl -fsSL "$url" -o "$temp_script"; then
        chmod +x "$temp_script"
        bash "$temp_script"
        rm -f "$temp_script"
        success "$name completed!"
    else
        error "Failed to download script from $url"
    fi
    echo -e "\n${DANGER}══════════════════════════════════════════════════════════${RESET}"
    read -p $'\e[93mPress Enter to return to menu...\e[0m' -r
}
# Main Menu
show_menu() {
    clear
    echo -e "${DANGER}"
    cat << "EOF"
 ___      ___       __       __    __   __     ___      ___ 
|"  \    /"  |     /""\     /" |  | "\ |" \   |"  \    /"  |
 \   \  //   |    /    \   (:  (__)  :)||  |   \   \  //   |
 /\\  \/.    |   /' /\  \   \/      \/ |:  |   /\\  \/.    |
|: \.        |  //  __'  \  //  __  \\ |.  |  |: \.        |
|.  \    /:  | /   /  \\  \(:  (  )  :)/\  |\ |.  \    /:  |
|___|\__/|___|(___/    \___)\__|  |__/(__\_|_)|___|\__/|___|
                                                           
                                              
EOF
    echo -e "${NEON_PURPLE}${BOLD} PTERODACTYL HOSTING MANAGER${RESET}\n"
    print_box_header "CONTROL PANEL" $NEON_PURPLE
    print_menu_option "1" "Panel Installation"
    print_menu_option "2" "Wings Installation"
    print_menu_option "3" "Uninstall Tools"
    print_menu_option "4" "Cloudflare Setup"
    print_menu_option "0" "Exit Manager"
    echo -e "\n${DANGER}══════════════════════════════════════════════════════════${RESET}"
    read -p $'\e[93m\e[1m Select option [0-10]: \e[0m' choice
    echo
}
# Welcome
welcome_banner
# Main Loop
while true; do
    show_menu
    case $choice in
        1) run_remote_script "https://raw.githubusercontent.com/mahimxyzz/Vps/refs/heads/main/cd/panel2.sh" "PANEL INSTALLATION" ;;
        2) run_remote_script "https://raw.githubusercontent.com/mahimxyzz/Vps/refs/heads/main/cd/wing2.sh" "WINGS INSTALLATION" ;;
        3) run_remote_script "https://raw.githubusercontent.com/mahimxyzz/Vps/refs/heads/main/cd/update2.sh" "PANEL UPDATE" ;;
        4) run_remote_script "https://raw.githubusercontent.com/mahimxyzz/Vps/refs/heads/main/cd/uninstall2.sh" "UNINSTALL TOOLS" ;;
        5) run_remote_script "https://raw.githubusercontent.com/mahimxyzz/Vps/refs/heads/main/cd/Blueprint2.sh" "BLUEPRINT SETUP" ;;
        6) run_remote_script "https://raw.githubusercontent.com/mahimxyzz/Vps/refs/heads/main/cd/cloudflare.sh" "CLOUDFLARE SETUP" ;;
        7) run_remote_script "https://raw.githubusercontent.com/mahimxyzz/Vps/refs/heads/main/cd/th2.sh" "THEME CHANGER" ;;
        
    esac
done

