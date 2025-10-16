#!/usr/bin/env bash

# Set GNOME Shell extensions
gsettings set org.gnome.shell disable-user-extensions false
gsettings set org.gnome.shell enabled-extensions "['color-picker@tuberry', 'gnome-40-ui-improvements@daniruiz', 'places-menu@gnome-shell-extensions.gcampax.github.com']"

# GNOME Tweaks
gsettings set org.gnome.tweaks show-extensions-notice false

# Interface
gsettings set org.gnome.desktop.interface accent-color 'blue'
gsettings set org.gnome.desktop.interface icon-theme 'Papirus-Dark'
gsettings set org.gnome.desktop.interface enable-animations false

# Background
gsettings set org.gnome.desktop.background color-shading-type 'solid'
gsettings set org.gnome.desktop.background picture-options 'scaled'
gsettings set org.gnome.desktop.background picture-uri "file:///path/to/your/wallpaper"
gsettings set org.gnome.desktop.background picture-uri-dark "file:///path/to/your/wallpaper"
gsettings set org.gnome.desktop.background primary-color '#000000'
gsettings set org.gnome.desktop.background secondary-color '#000000'

# Keyboard
gsettings set org.gnome.desktop.peripherals.keyboard delay 250
gsettings set org.gnome.desktop.peripherals.keyboard repeat true
gsettings set org.gnome.desktop.peripherals.keyboard repeat-interval 40

# Input sources
gsettings set org.gnome.desktop.input-sources sources "[('xkb', 'se')]"
gsettings set org.gnome.desktop.input-sources xkb-options "['terminate:ctrl_alt_bksp', 'caps:escape']"

# Window manager preferences
gsettings set org.gnome.desktop.wm.preferences button-layout 'icon:minimize,maximize,close'
gsettings set org.gnome.desktop.wm.preferences num-workspaces 8

# Keybindings (example for workspace 1)
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-1 "['<Shift><Super>1']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-1 "['<Super>1']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-left "['<Super>h']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-right "['<Super>l']"
gsettings set org.gnome.desktop.wm.keybindings close "['<Shift><Super>q']"
gsettings set org.gnome.desktop.wm.keybindings toggle-fullscreen "['<Super>f']"

# Mutter
gsettings set org.gnome.mutter center-new-windows true
gsettings set org.gnome.mutter dynamic-workspaces false
gsettings set org.gnome.mutter edge-tiling true

# Custom keybinding for terminal (kitty)
dconf write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings "['/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/']"
dconf write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/name "'Start Terminal'"
