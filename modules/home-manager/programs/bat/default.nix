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
          rev = "80657e11999ea6ac483934ad299daa04e002e2f9";
          sha256 = "sha256-u76DSzsv8TQxfe+2GUnZU3JzmXsgrTsKDt0qzO85j/I=";
        };
        file = "base16.tmTheme";
      };
    };
  };
}
