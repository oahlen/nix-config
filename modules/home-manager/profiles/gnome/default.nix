{
  config,
  lib,
  pkgs,
  ...
}:
with lib.hm.gvariant; {
  dconf.settings = {
    "org/gnome/shell" = {
      disable-user-extensions = false;
      enabled-extensions = with pkgs; [
        gnomeExtensions.color-picker.extensionUuid
        gnomeExtensions.gnome-40-ui-improvements.extensionUuid
        gnomeExtensions.places-status-indicator.extensionUuid
      ];
    };

    "org/gnome/tweaks" = {
      show-extensions-notice = false;
    };

    "org/gnome/desktop/interface" = {
      accent-color = "blue";
      icon-theme = "Papirus-Dark";
      enable-animations = false;
    };

    "org/gnome/desktop/background" = {
      color-shading-type = "solid";
      picture-options = "scaled";
      picture-uri = "file://${config.wallpaper}";
      picture-uri-dark = "file://${config.wallpaper}";
      primary-color = config.colors.background;
      secondary-color = config.colors.background;
    };

    "org/gnome/desktop/peripherals/keyboard" = {
      delay = mkUint32 250;
      repeat = true;
      repeat-interval = mkUint32 40;
    };

    "org/gnome/desktop/input-sources" = {
      sources = [(mkTuple ["xkb" "se"])];
      xkb-options = ["terminate:ctrl_alt_bksp" "caps:escape"];
    };

    "org/gnome/desktop/wm/preferences" = {
      button-layout = "icon:minimize,maximize,close";
      num-workspaces = 8;
    };

    "org/gnome/desktop/wm/keybindings" = {
      move-to-workspace-1 = ["<Shift><Super>1"];
      move-to-workspace-2 = ["<Shift><Super>2"];
      move-to-workspace-3 = ["<Shift><Super>3"];
      move-to-workspace-4 = ["<Shift><Super>4"];
      move-to-workspace-5 = ["<Shift><Super>5"];
      move-to-workspace-6 = ["<Shift><Super>6"];
      move-to-workspace-7 = ["<Shift><Super>7"];
      move-to-workspace-8 = ["<Shift><Super>8"];

      switch-to-workspace-1 = ["<Super>1"];
      switch-to-workspace-2 = ["<Super>2"];
      switch-to-workspace-3 = ["<Super>3"];
      switch-to-workspace-4 = ["<Super>4"];
      switch-to-workspace-5 = ["<Super>5"];
      switch-to-workspace-6 = ["<Super>6"];
      switch-to-workspace-7 = ["<Super>7"];
      switch-to-workspace-8 = ["<Super>8"];

      switch-to-workspace-left = ["<Super>h"];
      switch-to-workspace-right = ["<Super>l"];

      close = ["<Shift><Super>q"];
      toggle-fullscreen = ["<Super>f"];
    };

    # Unbind shell keybindings
    "org/gnome/shell/keybindings" = {
      "switch-to-application-1" = [];
      "switch-to-application-2" = [];
      "switch-to-application-3" = [];
      "switch-to-application-4" = [];
      "switch-to-application-5" = [];
      "switch-to-application-6" = [];
      "switch-to-application-7" = [];
      "switch-to-application-8" = [];
    };

    "org/gnome/mutter" = {
      center-new-windows = true;
      dynamic-workspaces = false;
      edge-tiling = true;
    };

    "org/gnome/settings-daemon/plugins/media-keys" = {
      custom-keybindings = [
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/"
      ];
    };

    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
      name = "Start Terminal";
      binding = "<Super>Return";
      command = "kitty";
    };

    "org/gnome/settings-daemon/plugins/media-keys" = {
      screensaver = ["<Super><Alt>l"];
    };

    "org/gtk/gtk4/settings/file-chooser" = {
      show-hidden = true;
    };

    "system/locale" = {
      region = "sv_SE.UTF-8";
    };
  };
}
