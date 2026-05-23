# hypr-windowmenu

A context menu for Hyprland window management on Wayland. Trigger it with a keybind to show a native-looking context menu at your cursor position with window operations.

## ⚡ Features

- **Auto-detects window under cursor** — no need to focus first
- **Native GTK3 styling** with dark Nord-inspired theme
- **Proper Wayland positioning** via gtk-layer-shell
- **Expandable menu system** via JSON configuration
- **Keyboard shortcut hints** displayed next to each action
- **Submenus** for Workspaces and Monitors
- **Confirmation dialog** for destructive actions

## 📦 Installation

```bash
cd hypr-windowmenu
makepkg -si
```

## 🚀 Usage

Add a keyboard shortcut to your `~/.config/hypr/hyprland.conf`:

```ini
# Super + M to show window menu
bind = $mainMod, M, exec, hypr-windowmenu
```

Or use any other key combination:
```ini
bind = $mainMod SHIFT, M, exec, hypr-windowmenu
bind = ALT, F4, exec, hypr-windowmenu
```

> **⚠️ Warning:** Mouse button binds (`mouse:273`) with `exec` crash Hyprland. Use keyboard shortcuts only. For mouse-triggered menus, install the `hyprbars` plugin.

### 🖱️ Mouse / Title Bar Button (via hyprbars)

For a **title bar button** that opens the menu on click, install the `hyprbars` plugin:

```bash
sudo bash hyprbars-setup.sh
```

Or manually install:
```bash
hyprpm add https://github.com/hyprwm/hyprland-plugins
hyprpm enable hyprbars
```

Then add to `~/.config/hypr/hyprland.conf`:

```ini
plugin {
    hyprbars {
        bar_height = 22
        bar_buttons_alignment = right
        
        # Close | Fullscreen | Menu
        hyprbars-button = rgb(ff4040), 10, , hyprctl dispatch killactive
        hyprbars-button = rgb(eeee11), 10, , hyprctl dispatch fullscreen 1
        hyprbars-button = rgb(88c0d0), 10, , hypr-windowmenu
    }
}
```

The last button (blue icon) opens `hypr-windowmenu` when clicked.

> **Note:** `hyprbars` adds title bars to **all** windows. Use window rules to disable on apps that already have native title bars.

### 🎹 Changing the Trigger Key

The trigger key is configured in **Hyprland**, not in this app. Any valid keyboard bind works:

```ini
# Super + M
bind = $mainMod, M, exec, hypr-windowmenu

# Alt + F4 (conflicts with close in many apps — avoid)
bind = ALT, F4, exec, hypr-windowmenu

# Super + Shift + M
bind = $mainMod SHIFT, M, exec, hypr-windowmenu
```

## ⚙️ Default Menu Actions

| Action | Dispatcher | Shortcut |
|--------|-----------|----------|
| Close | `killactive` | Alt+F4 |
| Force Kill | `killactive` | — |
| Maximize | `fullscreen 1` | Super+M |
| Minimize | `movetoworkspacesilent special:minimized` | — |
| Toggle Floating | `togglefloating` | Super+Shift+Space |
| Toggle Pin | `pin` | Super+P |
| Center Window | `centerwindow` | Super+C |
| Bring to Top | `bringactivetotop` | — |
| Move to Workspace | `movetoworkspacesilent` | Super+Shift+1..0 |
| Move to Monitor | `movetoworkspacesilent` | — |

## 🎛️ Settings GUI

A graphical settings editor is included. Run:

```bash
hypr-windowmenu-settings
```

**What you can do:**
- Toggle window title display in the menu
- Adjust title max length
- Add, remove, and reorder menu items
- Edit each item's label, icon, dispatcher, argument, shortcut hint, and confirmation setting
- Choose from action types: regular action, separator, workspace submenu, monitor submenu
- Preview your configuration before saving

The GUI saves to `~/.config/hypr-windowmenu/config.json`.

## 🔧 Manual Configuration

Copy the default config and customize:

```bash
mkdir -p ~/.config/hypr-windowmenu
cp /usr/share/hypr-windowmenu/config.json ~/.config/hypr-windowmenu/config.json
```

### Custom Actions

Add your own entries to the `actions` array:

```json
{
    "label": "My Custom Action",
    "icon": "application-x-executable",
    "dispatcher": "exec",
    "arg": "my-script.sh",
    "shortcut": "Super+X"
}
```

Available action types:
- `"action"` (default) — executes a Hyprland dispatcher
- `"separator"` — draws a horizontal line
- `"submenu_workspaces"` — shows workspace selector
- `"submenu_monitors"` — shows monitor selector

## 🏗️ Architecture

```
hypr-windowmenu
├── hypr-windowmenu            # Main Python/GTK3 application
├── hypr-windowmenu-settings   # GTK settings GUI
├── config.json                # Default menu configuration
├── PKGBUILD                   # Arch package build file
└── README.md                  # This file
```

**Why Python/GTK3 instead of a Hyprland plugin?**

- No C++ compilation required
- Works across Hyprland versions without recompilation
- Easier to customize and extend
- Leverages existing gtk-layer-shell for proper Wayland popup positioning

## 🛣️ Roadmap

- [x] GTK settings GUI for configuration
- [ ] Hyprland C++ plugin for border/titlebar right-click (no modifier needed)
- [ ] Custom CSS theme support
- [ ] Window grouping operations (tab/group management)
- [ ] Layout-specific actions (master/stack, dwindle)
- [ ] Notification feedback on action execution

## 📄 License

MIT
