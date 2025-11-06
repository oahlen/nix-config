{ callPackage, pkgs }:
callPackage ../home.nix {
  extraPackages = with pkgs; [
    _1password-gui
    awscli2
    duckdb
    fastfetchMinimal
    hyperfine
    nodejs # For Github Copilot
    powertop
    pqrs
    qsv
    ruff
    trash-cli
    typst
    wl-clipboard
    xdg-utils
  ];
}
