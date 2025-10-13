{hm-modules, ...}: {
  imports = [
    "${hm-modules}/profiles/niri"
    "${hm-modules}/programs/rbw"
  ];

  services.kanshi.enable = true;

  wallpaper = ./../../sunset.jpg;

  home.stateVersion = "25.05";
}
