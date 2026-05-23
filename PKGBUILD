# Maintainer: Dev BDA <ai.dev.bda@gmail.com>
pkgname=hypr-windowmenu
pkgver=1.0.0
pkgrel=1
pkgdesc="Context menu for Hyprland window management - right-click window operations"
arch=('any')
url="https://github.com/aidevbda-glitch/hypr-windowmenu"
license=('MIT')
depends=('python' 'python-gobject' 'gtk3' 'gtk-layer-shell' 'hyprland')
optdepends=('wmenu: alternative launcher support')
source=("hypr-windowmenu" "hypr-windowmenu-settings" "config.json" "hyprbars-setup.sh" "hyprbars.conf" "README.md")
sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')

package() {
    install -Dm755 "${srcdir}/hypr-windowmenu" "${pkgdir}/usr/bin/hypr-windowmenu"
    install -Dm755 "${srcdir}/hypr-windowmenu-settings" "${pkgdir}/usr/bin/hypr-windowmenu-settings"
    install -Dm644 "${srcdir}/config.json" "${pkgdir}/usr/share/hypr-windowmenu/config.json"
    
    # Install hyprbars helper files
    install -Dm644 "${srcdir}/hyprbars-setup.sh" "${pkgdir}/usr/share/doc/hypr-windowmenu/hyprbars-setup.sh"
    install -Dm644 "${srcdir}/hyprbars.conf" "${pkgdir}/usr/share/doc/hypr-windowmenu/hyprbars.conf"
    
    # Install documentation
    mkdir -p "${pkgdir}/usr/share/doc/hypr-windowmenu"
    cat > "${pkgdir}/usr/share/doc/hypr-windowmenu/README.md" << 'EOF'
# hypr-windowmenu

A context menu for Hyprland window management. Trigger it with a keybind to show a menu at your cursor with window operations.

## Installation

```bash
makepkg -si
```

## Usage

Add a keyboard shortcut to your `~/.config/hypr/hyprland.conf`:

```ini
# Super + M to show window menu
bind = $mainMod, M, exec, hypr-windowmenu
```

> **⚠️ Warning:** Mouse button binds (`mouse:273`) with `exec` crash Hyprland. Use keyboard shortcuts only.

### Mouse / Title Bar Button (via hyprbars)

For a clickable title bar button, install the hyprbars plugin:

```bash
sudo bash /usr/share/doc/hypr-windowmenu/hyprbars-setup.sh
```

Or manually:
```bash
hyprpm add https://github.com/hyprwm/hyprland-plugins
hyprpm enable hyprbars
```

Then add the configuration from `/usr/share/doc/hypr-windowmenu/hyprbars.conf` to your `hyprland.conf`.

## Settings GUI

Run `hypr-windowmenu-settings` to open a graphical config editor.

## Configuration

Copy `/usr/share/hypr-windowmenu/config.json` to `~/.config/hypr-windowmenu/config.json` and customize.
Or use `hypr-windowmenu-settings` for a graphical editor.

EOF
}
