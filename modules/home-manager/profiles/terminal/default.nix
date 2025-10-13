{
  config,
  hm-modules,
  ...
}: {
  imports = [
    "${hm-modules}/programs/bash"
    "${hm-modules}/programs/bat"
    "${hm-modules}/programs/fish"
    "${hm-modules}/programs/fzf"
    "${hm-modules}/programs/git"
    "${hm-modules}/programs/gitui"
    "${hm-modules}/programs/jq"
    "${hm-modules}/programs/neovim"
    "${hm-modules}/programs/ssh"
    "${hm-modules}/programs/tmux"
    "${hm-modules}/programs/yazi"
  ];

  home = {
    # Session variables
    sessionVariables = {
      AWS_CONFIG_FILE = "${config.home.sessionVariables.XDG_CONFIG_HOME}/aws/config";
      AWS_SHARED_CREDENTIALS_FILE = "${config.home.sessionVariables.XDG_CONFIG_HOME}/aws/credentials";
      CALCHISTFILE = "${config.home.sessionVariables.XDG_CACHE_HOME}/calc_history";
      CARGO_HOME = "${config.home.sessionVariables.XDG_DATA_HOME}/cargo";
      DOTNET_CLI_HOME = "${config.home.sessionVariables.XDG_DATA_HOME}/dotnet";
      FLAKE = "${config.home.homeDirectory}/nix-config";
      LESSHISTFILE = "${config.home.sessionVariables.XDG_DATA_HOME}/less/history";
      NUGET_PACKAGES = "${config.home.sessionVariables.XDG_CONFIG_HOME}/NuGetPackages";
      PGPASSFILE = "${config.home.sessionVariables.XDG_CONFIG_HOME}/pg/pgpass";
      PSQL_HISTORY = "${config.home.sessionVariables.XDG_DATA_HOME}/psql_history";
      _ZO_FZF_OPTS = "${config.home.sessionVariables.FZF_DEFAULT_OPTS}";
    };

    # Session path
    sessionPath = [
      "${config.home.sessionVariables.XDG_DATA_HOME}/dotnet/tools"
      "${config.home.sessionVariables.XDG_DATA_HOME}/cargo/bin"
    ];
  };

  programs = {
    eza.enable = true;
    fastfetch.enable = true;
    zoxide.enable = true;
  };
}
