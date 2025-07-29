{
  hm-modules,
  pkgs,
  ...
}: {
  imports = [
    "${hm-modules}/profiles/sway"
    "${hm-modules}/profiles/terminal"
    "${hm-modules}/programs/firefox"
    "${hm-modules}/programs/rbw"
  ];

  programs.bash.profileExtra = ''
    # If running from tty1 start sway
    if [ -z $DISPLAY ] && [ "$(tty)" = "/dev/tty1" ]; then
        exec sway
    fi
  '';

  programs = {
    obsidian.enable = true;
    keepassxc.enable = true;
    mangohud.enable = true;
    spotify-player.enable = true;
  };

  wallpaper = ./forest_3440_1440.jpg;

  home.packages = with pkgs; [
    bitwarden-desktop
    heroic
    inkscape
    iwgtk
    pinta
    transmission_4-gtk
  ];

  home.stateVersion = "22.11";
}
