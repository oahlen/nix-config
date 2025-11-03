{
  lib,
  rustPlatform,
  fetchFromGitHub,
}:
rustPlatform.buildRustPackage rec {
  pname = "homage";
  version = "0.4.0";

  src = fetchFromGitHub {
    owner = "oahlen";
    repo = "homage";
    rev = version;
    sha256 = "sha256-pxrfC9SfMVopPjTvV9IrvtRzwo3CISrPaPQNiGc8vAE=";
  };

  cargoHash = "sha256-JKRLdCEILCcOdygjC1k/SJ+MWjzkZlYoWA0E68JT+7E=";

  meta = with lib; {
    description = "Simple and effective dotfiles manager for your home.";
    mainProgram = "homage";
    homepage = "https://github.com/oahlen/homage";
    license = with licenses; [ mit ];
    # maintainers = [];
  };
}
