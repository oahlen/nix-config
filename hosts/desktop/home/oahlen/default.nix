{hm-modules, ...}: {
  imports = [
    "${hm-modules}/profiles/niri"
    "${hm-modules}/profiles/terminal"
    "${hm-modules}/programs/mangohud"
    "${hm-modules}/programs/rbw"
  ];

  programs = {
    spotify-player.enable = true;
  };

  wallpaper = ./../../lake.png;

  home.stateVersion = "22.11";
}
