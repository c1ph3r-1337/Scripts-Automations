#!/bin/bash

# Launch kitty terminal with this script inside it

# ASCII Art
ascii_art="""
  ██████╗  █████╗ ███╗   ███╗███████╗     ██████╗██╗   ██╗███████╗██████╗ 
██╔════╝ ██╔══██╗████╗ ████║██╔════╝    ██╔═══██╗██║   ██║██╔════╝██╔══██╗
██║  ███╗███████║██╔████╔██║█████╗      ██║   ██║██║   ██║█████╗  ██████╔╝
██║   ██║██╔══██║██║╚██╔╝██║██╔══╝      ██║   ██║║██║ ██╔╝██╔══╝  ██╔══██╗
╚██████╔╝██║  ██║██║ ╚═╝ ██║███████╗    ╚██████╔╝╚██████║ ███████╗██║  ██║
 ╚═════╝ ╚═╝  ╚═╝╚═╝     ╚═╝╚══════╝     ╚═════╝  ╚═════╝ ╚══════╝╚═╝  ╚═╝
BYE, c!ph3r

"""

# Clear screen and get terminal size
tput clear
rows=$(tput lines)
cols=$(tput cols)

# Split ASCII art into lines
IFS=$'\n' read -rd '' -a lines <<<"$ascii_art"
art_height=${#lines[@]}

# Calculate vertical offset to center
start_row=$(( (rows - art_height - 5) / 2 ))

# Print vertical spacing
for ((i=0; i<start_row; i++)); do echo ""; done

# Print centered ASCII art
for line in "${lines[@]}"; do
  line_length=${#line}
  padding=$(( (cols - line_length) / 2 ))
  printf "%*s%s\n" $padding "" "$line"
done

# Centered menu
menu_items=(
  ""
  "What do you want to do with the system?"
  " 1) Shutdown"
 "2) Restart"
 "3) Cancel"	
""
)

for item in "${menu_items[@]}"; do
  padding=$(( (cols - ${#item}) / 2 ))
  printf "%*s%s\n" $padding "" "$item"
done

# Read input
read -p "$(printf "%*s" $(( (cols - 18) / 2 )) "Choose an option: ")" choice

case $choice in
  1)
    sudo shutdown now
    ;;
  2)
    sudo reboot
    ;;
  *)
    clear
    echo "Action cancelled."
    sleep 2
    ;;
esac
