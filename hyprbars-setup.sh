#!/bin/bash
# hyprbars-setup.sh - Install hyprbars plugin for hypr-windowmenu mouse support
# Run with: sudo bash hyprbars-setup.sh

set -e

echo "=== Installing hyprbars plugin for Hyprland ==="
echo ""

# Check if running as root
if [ "$EUID" -ne 0 ]; then
    echo "⚠️  This script needs to run as root (sudo)."
    echo "   Please run: sudo bash $0"
    exit 1
fi

# Install hyprbars via hyprpm if available
if command -v hyprpm &> /dev/null; then
    echo "→ Using hyprpm to install hyprbars..."
    hyprpm add https://github.com/hyprwm/hyprland-plugins
    hyprpm enable hyprbars
    hyprpm update
    echo "✅ hyprbars installed via hyprpm"
else
    echo "⚠️  hyprpm not found. Trying AUR package..."
    
    # Check for yay/paru
    if command -v yay &> /dev/null; then
        yay -S --noconfirm hyprland-plugin-hyprbars
        echo "✅ hyprbars installed from AUR"
    elif command -v paru &> /dev/null; then
        paru -S --noconfirm hyprland-plugin-hyprbars
        echo "✅ hyprbars installed from AUR"
    else
        echo "❌ No AUR helper found. Please install manually:"
        echo "   yay -S hyprland-plugin-hyprbars"
        echo "   or"
        echo "   paru -S hyprland-plugin-hyprbars"
        exit 1
    fi
fi

echo ""
echo "=== Configuration ==="
echo ""
echo "Add this to your ~/.config/hypr/hyprland.conf:"
echo ""
cat << 'EOF'
plugin {
    hyprbars {
        bar_height = 22
        bar_buttons_alignment = right
        bar_padding = 8
        bar_button_padding = 5
        
        # Buttons (right to left)
        # Close button
        hyprbars-button = rgb(ff4040), 10, , hyprctl dispatch killactive
        
        # Fullscreen button  
        hyprbars-button = rgb(eeee11), 10, , hyprctl dispatch fullscreen 1
        
        # Menu button (opens hypr-windowmenu)
        hyprbars-button = rgb(88c0d0), 10, , hypr-windowmenu
    }
}
EOF

echo ""
echo "=== Done ==="
echo "Reload Hyprland after adding the config:"
echo "   hyprctl reload"
