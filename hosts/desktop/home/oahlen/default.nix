{hm-modules, ...}: {
  imports = [
    "${hm-modules}/profiles/sway"
    "${hm-modules}/profiles/terminal"
    "${hm-modules}/programs/iwgtk"
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

  wallpaper = ./../../sunset.jpg;

  home.stateVersion = "22.11";
}
