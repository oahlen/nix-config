{
  lib,
  rustPlatform,
  fetchFromGitHub,
}:
rustPlatform.buildRustPackage rec {
  pname = "homage";
  version = "0.3.0";

  src = fetchFromGitHub {
    owner = "oahlen";
    repo = "homage";
    rev = version;
    sha256 = "sha256-yqGzNAlYDnykBSy3k+iDzyGdn4ff47Oa21+VxFGl1zg=";
  };

  cargoHash = "sha256-VgSQKgr+jCgQHC4PFVQiS3zIawXyuOtCPal5fs97i2k=";

  meta = with lib; {
    description = "Simple and effective dotfiles manager for your home.";
    mainProgram = "homage";
    homepage = "https://github.com/oahlen/homage";
    license = with licenses; [ mit ];
    # maintainers = [];
  };
}
