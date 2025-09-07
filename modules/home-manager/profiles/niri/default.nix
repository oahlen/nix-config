{hm-modules, ...}: {
  imports = [
    "${hm-modules}/programs/foot"
    "${hm-modules}/programs/fuzzel"
    "${hm-modules}/programs/swaylock"
    "${hm-modules}/programs/waybar"
    "${hm-modules}/services/mako"
    "${hm-modules}/services/swaybg"
    "${hm-modules}/services/wl-sunset"
    ./swayidle.nix
    ./waybar.nix
  ];

  wayland.systemd.target = "niri-session.target";

  scripts = {
    password-picker.enable = true;
    theme-switcher.enable = true;
    wl-logout.enable = true;
  };
}
