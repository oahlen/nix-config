{pkgs, ...}: {
  programs.waybar.settings.mainBar = {
    modules-left = [
      "niri/workspaces"
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
    "niri/language" = {
      format = " ";
      tooltip-format = "Language: {long}";
      on-click = "${pkgs.niri}/bin/niri msg action switch-layout next";
    };
  };
}
