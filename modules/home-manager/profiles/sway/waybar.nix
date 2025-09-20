{pkgs, ...}: {
  programs.waybar.settings.mainBar = {
    modules-left = [
      "sway/workspaces"
      "sway/mode"
    ];
    modules-right = [
      "sway/language"
      "bluetooth"
      "network"
      "pulseaudio"
      "backlight"
      "battery"
      "clock"
    ];
    "sway/workspaces" = {
      disable-scroll = true;
    };
    "sway/language" = {
      format = "{short}";
      tooltip-format = "Language: {long}";
      on-click = "${pkgs.sway}/bin/swaymsg input type:keyboard xkb_switch_layout next";
    };
  };
}
