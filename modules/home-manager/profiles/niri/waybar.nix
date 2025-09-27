{...}: {
  programs.waybar.settings.mainBar = {
    modules-left = [
      "niri/workspaces"
    ];
    "niri/workspaces" = {
      disable-scroll = true;
    };
  };
}
