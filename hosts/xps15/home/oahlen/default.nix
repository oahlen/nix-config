{hm-modules, ...}: {
  imports = [
    "${hm-modules}/profiles/niri"
  ];

  services.kanshi.enable = true;

  wallpaper = ./../../sunset.jpg;

  home.stateVersion = "25.05";
}
