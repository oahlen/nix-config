{hm-modules, ...}: {
  imports = [
    "${hm-modules}/profiles/shared/desktop"
    "${hm-modules}/programs/foot"
    "${hm-modules}/programs/fuzzel"
    "${hm-modules}/programs/waybar"
    "${hm-modules}/services/mako"
    "${hm-modules}/services/swaybg"
    "${hm-modules}/services/swayosd"
    "${hm-modules}/services/wl-sunset"
    ./swayidle.nix
    ./waybar.nix
  ];

  wayland.systemd.target = "niri-session.target";
}
