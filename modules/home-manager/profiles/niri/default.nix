{
  hm-modules,
  pkgs,
  ...
}: {
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

  programs.fuzzel.settings.main.launch-prefix = "${pkgs.niri}/bin/niri msg action spawn --";

  scripts = {
    password-picker.enable = true;
    theme-switcher.enable = true;
    wl-logout.enable = true;
  };

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      icon-theme = "Papirus-Dark";
    };
  };
}
