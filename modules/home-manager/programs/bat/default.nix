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
          rev = "de3af06bff77357602dc402ec5cfa8aa0fe438d3";
          sha256 = "sha256-55XxjdNPPn3HdHJYzGNe69Lab1yWn72xXCu/ji7QpNI=";
        };
        file = "base16.tmTheme";
      };
    };
  };
}
