{hm-modules, ...}: {
  imports = [
    "${hm-modules}/profiles/shared/desktop"
    "${hm-modules}/programs/foot"
    "${hm-modules}/programs/fuzzel"
    "${hm-modules}/services/mako"
    "${hm-modules}/services/swaybg"
    "${hm-modules}/services/swayosd"
    "${hm-modules}/services/wl-sunset"
  ];

  wayland.systemd.target = "niri-session.target";
}
