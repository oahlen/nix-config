{nixos-modules, ...}: {
  imports = [
    "${nixos-modules}/desktop/shared/fonts.nix"
  ];

  services.displayManager.cosmic-greeter.enable = true;
  services.desktopManager.cosmic.enable = true;
}
