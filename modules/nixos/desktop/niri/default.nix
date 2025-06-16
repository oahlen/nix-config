{nixos-modules, ...}: {
  imports = [
    "${nixos-modules}/desktop/shared"
  ];

  programs.niri.enable = true;
}
