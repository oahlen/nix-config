{hm-modules, ...}: {
  imports = [
    "${hm-modules}/profiles/niri"
    "${hm-modules}/programs/mangohud"
    "${hm-modules}/programs/rbw"
  ];

  wallpaper = ./../../lake.png;

  home.stateVersion = "22.11";
}
