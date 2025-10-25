{
  lib,
  rustPlatform,
  fetchFromGitHub,
}:
rustPlatform.buildRustPackage rec {
  pname = "homage";
  version = "0.1.0";

  src = fetchFromGitHub {
    owner = "oahlen";
    repo = "homage";
    rev = version;
    sha256 = "sha256-oRiVSy4M/acBPva4KdxpqRaGAqEepgQznxd4OjwMycA=";
  };

  cargoHash = "sha256-wDZd8XlU1/NGQG2wJQ7Mb9eewikjr1dgnY/TBu+1sSs=";

  meta = with lib; {
    description = "Simple and effective dotfiles manager for your home.";
    mainProgram = "homage";
    homepage = "https://github.com/oahlen/homage";
    license = with licenses; [ mit ];
    # maintainers = [];
  };
}
