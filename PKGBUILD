# Maintainer: Dev BDA <ai.dev.bda@example.com>
pkgname=hypr-windowmenu
pkgver=1.0.0
pkgrel=1
pkgdesc="Context menu for Hyprland window management - right-click window operations"
arch=('any')
url="https://github.com/aidevbda-glitch/hypr-windowmenu"
license=('MIT')
depends=('python' 'python-gobject' 'gtk3' 'gtk-layer-shell' 'hyprland')
optdepends=('wmenu: alternative launcher support')
source=("hypr-windowmenu" "hypr-windowmenu-settings" "config.json")
sha256sums=('SKIP' 'SKIP' 'SKIP')

package() {
    install -Dm755 "${srcdir}/hypr-windowmenu" "${pkgdir}/usr/bin/hypr-windowmenu"
    install -Dm755 "${srcdir}/hypr-windowmenu-settings" "${pkgdir}/usr/bin/hypr-windowmenu-settings"
    install -Dm644 "${srcdir}/config.json" "${pkgdir}/usr/share/hypr-windowmenu/config.json"
    
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

Add to your `~/.config/hypr/hyprland.conf`:

```ini
# Super + Right Click to show window menu
bind = $mainMod, mouse:273, exec, hypr-windowmenu
```

Or bind to a keyboard shortcut:
```ini
bind = $mainMod SHIFT, M, exec, hypr-windowmenu
```

## Settings GUI

Run `hypr-windowmenu-settings` to open a graphical config editor:

- Toggle window title display
- Change title max length
- Add/remove/reorder menu items
- Edit action properties (label, icon, dispatcher, argument, shortcut)
- Preview changes before saving

## Features

- Auto-detects window under cursor
- Shows window title and class
- Operations: Close, Kill, Maximize, Minimize, Toggle Floating, Toggle Pin, Center, Bring to Top
- Submenus: Move to Workspace, Move to Monitor
- Configurable via JSON or GUI

## Configuration

Copy `/usr/share/hypr-windowmenu/config.json` to `~/.config/hypr-windowmenu/config.json` and customize.
Or use `hypr-windowmenu-settings` for a graphical editor.

EOF
}
