{...}: {
  programs.waybar.settings.mainBar = {
    modules-left = [
      "niri/workspaces"
    ];
    modules-center = [
      "clock"
    ];
    modules-right = [
      "battery"
      "tray"
    ];
    "niri/workspaces" = {
      disable-scroll = true;
    };
  };
}
