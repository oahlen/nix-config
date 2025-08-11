{pkgs, ...}: {
  programs.bat = {
    enable = true;

    config = {
      theme = "base16";
    };

    themes = {
      base16 = {
        src = pkgs.fetchFromGitHub {
          owner = "oahlen";
          repo = "base16.tmTheme";
          rev = "878abdbe8001f79eb40078067f8b4a0e7a2dd93a";
          sha256 = "sha256-FmCvGw48cePmU9S9Y/TrNkfxNxvqnyVCoRsIK92jxME=";
        };
        file = "base16.tmTheme";
      };
    };
  };
}
