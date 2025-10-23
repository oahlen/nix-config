{
  nixpkgs,
  system,
  ...
}:
let
  pkgs = import nixpkgs { inherit system; };
in
pkgs.mkShell {
  NIX_SHELL = "Rust";

  RUST_SRC_PATH = "${pkgs.rust.packages.stable.rustPlatform.rustLibSrc}";

  packages = with pkgs; [
    cargo
    clippy
    openssl
    pkg-config
    rust-analyzer
    rustc
    rustfmt
  ];
}
