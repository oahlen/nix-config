{
  hm-modules,
  pkgs,
  ...
}: {
  imports = [
    "${hm-modules}/profiles/niri"
    "${hm-modules}/profiles/terminal"
    "${hm-modules}/programs/ideavim"
    "${hm-modules}/programs/rbw"
  ];

  services.kanshi.enable = true;

  wallpaper = ./../../sunset.jpg;

  home.packages = with pkgs; [
    nodejs
  ];

  home.stateVersion = "25.05";
}
