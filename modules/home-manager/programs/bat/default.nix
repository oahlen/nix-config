{pkgs, ...}: {
  programs = let
    batman = pkgs.bat-extras.batman;
  in {
    fish = {
      interactiveShellInit = ''
        ${batman}/bin/batman --export-env | source
      '';
    };

    bat = {
      enable = true;

      extraPackages = [
        batman
      ];

      config = {
        theme = "base16";
      };

      themes = {
        base16 = {
          src = pkgs.fetchFromGitHub {
            owner = "oahlen";
            repo = "base16.tmTheme";
            rev = "e080b6ea504d84c909a79d7a010a7c0297b1d818";
            sha256 = "sha256-8sLXrpayPqfmzpyVyU3qIDiF5TJ6OWRXodHW+25/F7I=";
          };
          file = "base16.tmTheme";
        };
      };
    };
  };
}
