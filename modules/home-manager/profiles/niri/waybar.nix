{pkgs, ...}: {
  programs.waybar.settings.mainBar = {
    modules-left = [
      "niri/workspaces"
      "niri/window"
    ];
    modules-right = [
      "tray"
      "power-profiles-daemon"
      "niri/language"
      "pulseaudio"
      "battery"
      "clock"
    ];
    "niri/workspaces" = {
      disable-scroll = true;
    };
    "niri/window" = {
      max-length = 100;
    };
    "niri/language" = {
      format = "  {short}";
      tooltip-format = "Language: {long}";
      on-click = "${pkgs.niri}/bin/niri msg action switch-layout next";
    };
  };
}
