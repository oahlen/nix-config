{
  hm-modules,
  pkgs,
  ...
}: {
  imports = [
    "${hm-modules}/profiles/sway"
    "${hm-modules}/profiles/terminal"
    "${hm-modules}/programs/rbw"
  ];

  programs.bash.profileExtra = ''
    # If running from tty1 start sway
    if [ -z $DISPLAY ] && [ "$(tty)" = "/dev/tty1" ]; then
        exec sway
    fi
  '';

  programs = {
    librewolf.enable = true;
    chromium.enable = true;
    obsidian.enable = true;
    keepassxc.enable = true;
    mangohud.enable = true;
    spotify-player.enable = true;
  };

  home.packages = with pkgs; [
    bitwarden-desktop
    gimp
    heroic
    inkscape
    iwgtk
    pinta
    prismlauncher
    transmission_4-gtk
  ];

  home.stateVersion = "22.11";
}
