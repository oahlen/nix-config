{hm-modules, ...}: {
  imports = [
    "${hm-modules}/profiles/niri"
    "${hm-modules}/programs/mangohud"
  ];

  wallpaper = ./../../lake.png;

  home.stateVersion = "22.11";
}
