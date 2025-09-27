{hm-modules, ...}: {
  imports = [
    "${hm-modules}/profiles/niri"
    "${hm-modules}/profiles/terminal"
    "${hm-modules}/programs/mangohud"
    "${hm-modules}/programs/rbw"
  ];

  programs.bash.profileExtra = ''
    # If running from tty1 start sway
    if [ -z $DISPLAY ] && [ "$(tty)" = "/dev/tty1" ]; then
        exec sway
    fi
  '';

  programs = {
    spotify-player.enable = true;
  };

  wallpaper = ./../../lake.png;

  home.stateVersion = "22.11";
}
