{
  hm-modules,
  pkgs,
  ...
}: {
  imports = [
    "${hm-modules}/profiles/terminal"
  ];

  programs.git.lfs.enable = true;

  scripts = {
    markdown-viewer.enable = true;
    op-password-picker.enable = true;
    toPdf.enable = true;
  };

  home = {
    sessionVariables = {
      COLORTERM = "truecolor"; # Windows Terminal fix
    };

    packages = with pkgs; [
      # awscli2
      _1password-cli
      duckdb
      hyperfine
      nodejs # For Github Copilot
      pqrs
      qsv
      typst
      wl-clipboard
      xdg-utils
    ];
  };

  home.stateVersion = "24.11";
}
