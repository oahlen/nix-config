{
  lib,
  rustPlatform,
  fetchFromGitHub,
}:
rustPlatform.buildRustPackage {
  pname = "homeage";
  version = "0.1.0";

  src = fetchFromGitHub {
    owner = "oahlen";
    repo = "homeage";
    rev = "28f0a42c17adfb63a702d074a0d70b8c880c445a";
    sha256 = "sha256-dtIY1LeLB7Po3XKSWpfQAxWeDbipasXYYipd+1/60vw=";
  };

  cargoHash = "sha256-hVfAs1XLcSbR+dorTVm8BaZg9nFrFihwLDIdc6vah1A=";

  meta = with lib; {
    description = "Simple and effective dotfiles manager for your home.";
    mainProgram = "homeage";
    homepage = "https://github.com/oahlen/homeage";
    license = with licenses; [ mit ];
    # maintainers = [];
  };
}
