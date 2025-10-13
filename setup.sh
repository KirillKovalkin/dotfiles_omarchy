#!/bin/bash

[[ -d "hypr" && -d "waybar" ]] || {
    echo "❌ Missing hypr or waybar directories."
    exit 1
}

echo "🧹 Deleting old configurations"
rm -rf "$HOME/.config/hypr/" "$HOME/.config/waybar"

echo "📦 Copying new configurations"
cp -r hypr "$HOME/.config/"
cp -r waybar "$HOME/.config/"
hyprctl reload
echo "✅ New configurations is installed"

echo "📥 Installing packages"
sudo pacman -S tree telegram-desktop firefox discord yazi android-tools --noconfirm
yay -S polychromatic google-chrome yandex-music-native android-studio --noconfirm
sudo gpasswd -a $USER plugdev
echo "✅ Packages is installed"

