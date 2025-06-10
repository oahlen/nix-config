{
  hm-modules,
  pkgs,
  ...
}: {
  imports = [
    "${hm-modules}/desktop/sway"
    "${hm-modules}/programs/rbw"
  ];

  programs.bash.profileExtra = ''
    # If running from tty1 start sway
    if [ -z $DISPLAY ] && [ "$(tty)" = "/dev/tty1" ]; then
        exec sway
    fi
  '';

  programs.chromium.enable = true;
  programs.mangohud.enable = true;
  programs.spotify-player.enable = true;

  home.packages = with pkgs; [
    bitwarden-desktop
    gimp
    heroic
    inkscape
    iwgtk
    keepassxc
    librewolf
    obsidian
    pinta
    prismlauncher
    transmission_4-gtk
  ];

  home.stateVersion = "22.11";
}
