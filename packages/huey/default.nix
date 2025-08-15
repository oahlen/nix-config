{
  lib,
  rustPlatform,
  fetchFromGitHub,
}:
rustPlatform.buildRustPackage rec {
  pname = "huey";
  version = "0.4.0";

  src = fetchFromGitHub {
    owner = "oahlen";
    repo = "huey";
    rev = version;
    sha256 = "sha256-bRQ0bMKRNoccRxXXuND/dGzV5oYJhiKvLXlUZ8taTTc=";
  };

  cargoHash = "sha256-cnJcO5ZxsPZjyuSTYnRar4ZdEidGiOoBGW1icgDnOBg=";

  meta = with lib; {
    description = "Neovim lua color scheme generator written in Rust.";
    mainProgram = "huey";
    homepage = "https://github.com/oahlen/huey";
    license = with licenses; [mit];
    # maintainers = [];
  };
}
