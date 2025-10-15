{hm-modules, ...}: {
  imports = [
    "${hm-modules}/profiles/niri"
  ];

  wallpaper = ./../../lake.png;

  home.stateVersion = "22.11";
}
