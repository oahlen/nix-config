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

  xdg.configFile."niri/config.kdl".source = ./config.kdl;

  scripts = {
    password-picker.enable = true;
    theme-switcher.enable = true;
    wl-logout.enable = true;
  };
}
