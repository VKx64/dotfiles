#!/bin/zsh

# Configuration
MONITOR=""
HYPRPAPER_CONF="$HOME/dotfiles/.config/hypr/hyprpaper.conf"

# Check if wallpaper provided via arg
if [[ -z "$1" ]]; then
  echo "Usage: $0 /path/to/your/wallpaper.png"
  exit 1
fi

# Get Wallpaper from first arg
WALLPAPER="$1"

# Check if wallpaper exists
if [[ ! -f "$WALLPAPER" ]]; then
  echo "Error: The file '$WALLPAPER' does not exists."
  exit 1
fi

# Update Hyprpaper.conf
sed -i "s#^preload = .*#preload = $WALLPAPER#" "$HYPRPAPER_CONF"
sed -i "s#^wallpaper = ,.*#wallpaper = ,$WALLPAPER#" "$HYPRPAPER_CONF"

# Set Wallpaper with hyprpaper
hyprctl hyprpaper preload "$WALLPAPER"
hyprctl hyprpaper wallpaper "$MONITOR,$WALLPAPER"

# General Colors with Hellwal
hellwal -i "$WALLPAPER"

echo "Wallpaper and Color Scheme Updated :3"