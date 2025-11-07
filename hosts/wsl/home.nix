{ callPackage, pkgs }:
callPackage ../home.nix {
  extraPackages = with pkgs; [
    awscli2
    duckdb
    fastfetchMinimal
    hyperfine
    nodejs # For Github Copilot
    pqrs
    qsv
    ruff
    trash-cli
    typst
    wl-clipboard
    xdg-utils
  ];
}
