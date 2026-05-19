#!/bin/bash

# Colors
GREEN_LIGHT='\033[92m'
GREEN_DARK='\033[32m'
GREEN_CYAN='\033[36m'
GREEN_BRIGHT='\033[92;1m'
YELLOW_GREEN='\033[93m'
NC='\033[0m'

# Banner lines
BANNER_LINES=(
"   ██████╗ ███████╗████████╗██████╗  ██████╗ "
"   ██╔══██╗██╔════╝╚══██╔══╝██╔══██╗██╔═══██╗"
"   ██████╔╝█████╗     ██║   ██████╔╝██║   ██║"
"   ██╔═══╝ ██╔══╝     ██║   ██╔══██╗██║   ██║"
"   ██║     ███████╗   ██║   ██║  ██║╚██████╔╝"
"   ╚═╝     ╚══════╝   ╚═╝   ╚═╝  ╚═╝ ╚═════╝ "
)

# Hide cursor
tput civis

# Function: Pulse effect (zoom in/out)
pulse_effect() {
    local scales=(1 1 0.9 0.8 0.9 1 1.1 1.2 1.1 1)
    for scale in "${scales[@]}"; do
        clear
        if (( $(echo "$scale == 1" | bc -l) )); then
            echo -e "${GREEN_BRIGHT}"
        elif (( $(echo "$scale > 1" | bc -l) )); then
            echo -e "${GREEN_LIGHT}"
        else
            echo -e "${GREEN_DARK}"
        fi
        
        for line in "${BANNER_LINES[@]}"; do
            if (( $(echo "$scale != 1" | bc -l) )); then
                # Simulate scaling by adding/removing spaces
                if (( $(echo "$scale < 1" | bc -l) )); then
                    echo "   $line"
                else
                    echo "      $line"
                fi
            else
                echo "$line"
            fi
        done
        echo -e "${NC}"
        sleep 0.08
    done
}

# Function: Slide from left
slide_effect() {
    for offset in {0..20}; do
        clear
        echo -e "${GREEN_CYAN}"
        for line in "${BANNER_LINES[@]}"; do
            printf "%${offset}s%s\n" "" "$line"
        done
        echo -e "${NC}"
        sleep 0.03
    done
}

# Function: Rainbow green wave
wave_effect() {
    local colors=($GREEN_DARK $GREEN_LIGHT $GREEN_CYAN $GREEN_BRIGHT $YELLOW_GREEN)
    for i in {1..30}; do
        clear
        local color_idx=$((i % ${#colors[@]}))
        echo -e "${colors[$color_idx]}"
        for line in "${BANNER_LINES[@]}"; do
            # Create wave by shifting characters
            local shift=$((i % 10))
            printf "%${shift}s%s\n" "" "$line"
        done
        echo -e "${NC}"
        sleep 0.05
    done
}

# Function: Blinking letters
blink_effect() {
    for blink in {1..20}; do
        if ((blink % 2 == 0)); then
            clear
            echo -e "${GREEN_BRIGHT}"
            for line in "${BANNER_LINES[@]}"; do
                echo "$line"
            done
        else
            clear
            echo -e "${GREEN_DARK}"
            for line in "${BANNER_LINES[@]}"; do
                echo "$line"
            done
        fi
        echo -e "${NC}"
        sleep 0.15
    done
}

# Function: Rotating colors
color_cycle() {
    local colors=($GREEN_DARK $GREEN_LIGHT $GREEN_CYAN $GREEN_BRIGHT)
    while true; do
        for color in "${colors[@]}"; do
            clear
            echo -e "${color}"
            for line in "${BANNER_LINES[@]}"; do
                echo "$line"
            done
            echo -e "${NC}"
            sleep 0.3
        done
    done
}

# Main animation sequence
main() {
    while true; do
        # Pulse effect
        pulse_effect
        sleep 0.5
        
        # Slide effect
        slide_effect
        sleep 0.5
        
        # Wave effect
        wave_effect
        sleep 0.5
        
        # Blink effect
        blink_effect
        sleep 0.5
        
        # Color cycle (runs until interrupted)
        color_cycle
    done
}

# Trap Ctrl+C to show cursor
trap 'tput cnorm; clear; exit' INT

# Run animation
main
