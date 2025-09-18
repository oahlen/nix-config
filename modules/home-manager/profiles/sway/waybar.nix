{pkgs, ...}: {
  programs.waybar.settings.mainBar = {
    modules-left = [
      "sway/workspaces"
      "sway/mode"
      "sway/window"
    ];
    modules-right = [
      "tray"
      "power-profiles-daemon"
      "sway/language"
      "pulseaudio"
      "battery"
      "clock"
    ];
    "sway/workspaces" = {
      disable-scroll = true;
    };
    "sway/window" = {
      max-length = 100;
    };
    "sway/language" = {
      format = " ";
      tooltip-format = "Language: {long}";
      on-click = "${pkgs.sway}/bin/swaymsg input type:keyboard xkb_switch_layout next";
    };
  };
}
