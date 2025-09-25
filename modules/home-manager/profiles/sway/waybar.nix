{...}: {
  programs.waybar.settings.mainBar = {
    modules-left = [
      "sway/workspaces"
      "sway/mode"
    ];
    modules-center = [
      "clock"
    ];
    modules-right = [
      "battery"
      "tray"
    ];
    "sway/workspaces" = {
      disable-scroll = true;
    };
  };
}
