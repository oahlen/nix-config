{pkgs, ...}: {
  programs.waybar.settings.mainBar = {
    modules-left = [
      "niri/workspaces"
    ];
    modules-right = [
      "niri/language"
      "bluetooth"
      "network"
      "pulseaudio"
      "backlight"
      "battery"
      "clock"
    ];
    "niri/workspaces" = {
      disable-scroll = true;
    };
    "niri/language" = {
      format = "{short}";
      tooltip-format = "Language: {long}";
      on-click = "${pkgs.niri}/bin/niri msg action switch-layout next";
    };
  };
}
