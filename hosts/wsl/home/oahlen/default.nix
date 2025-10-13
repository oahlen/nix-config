{
  common-modules,
  hm-modules,
  pkgs,
  ...
}: {
  imports = [
    "${hm-modules}/profiles/terminal"
  ];

  programs.git.lfs.enable = true;

  colors = import "${common-modules}/colors/tokyonight-light.nix";

  home = {
    sessionVariables = {
      COLORTERM = "truecolor"; # Windows Terminal fix
    };

    packages = with pkgs; [
      # awscli2 # Currently broken
      _1password-cli
      duckdb
      hyperfine
      nodejs # For Github Copilot
      pqrs
      qsv
      stow
      typst
      wl-clipboard
      xdg-utils
    ];
  };

  home.stateVersion = "24.11";
}
