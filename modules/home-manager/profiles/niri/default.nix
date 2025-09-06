{hm-modules, ...}: {
  imports = [
    "${hm-modules}/programs/foot"
    "${hm-modules}/programs/fuzzel"
    "${hm-modules}/programs/swaylock"
    "${hm-modules}/programs/waybar"
    "${hm-modules}/services/mako"
    "${hm-modules}/services/swayidle"
    "${hm-modules}/services/wl-sunset"
  ];

  wayland.systemd.target = "graphical-session.target";

  scripts = {
    password-picker.enable = true;
    theme-switcher.enable = true;
    wl-logout.enable = true;
  };
}
