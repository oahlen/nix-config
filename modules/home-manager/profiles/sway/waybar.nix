{...}: {
  programs.waybar.settings.mainBar = {
    modules-left = [
      "sway/workspaces"
      "sway/mode"
    ];
    "sway/workspaces" = {
      disable-scroll = true;
    };
  };
}
