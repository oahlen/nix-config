{hm-modules, ...}: {
  imports = [
    "${hm-modules}/desktop/shared"
    "${hm-modules}/programs/foot"
    "${hm-modules}/programs/fuzzel"
    "${hm-modules}/services/mako"
    "${hm-modules}/services/swayidle"
    "${hm-modules}/services/wl-sunset"
  ];

  wayland.systemd.target = "graphical-session.target";

  scripts.password-picker.enable = true;
  scripts.wl-logout.enable = true;
}
