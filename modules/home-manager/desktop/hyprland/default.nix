{hm-modules, ...}: {
  imports = [
    "${hm-modules}/desktop/shared"
    "${hm-modules}/programs/foot"
    "${hm-modules}/programs/fuzzel"
    "${hm-modules}/services/mako"
  ];

  wayland.systemdTarget = "hyprland-session.target";

  scripts.password-picker.enable = true;
  scripts.wl-logout.enable = true;

  home.pointerCursor.hyprcursor.enable = true;
  home.pointerCursor.hyprcursor.size = 24;

  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = false;
  };

  programs.hyprlock.enable = true;

  services.hypridle.enable = true;
  services.hyprpaper.enable = true;
  services.hyprpolkitagent.enable = true;
  services.hyprsunset.enable = true;
}
