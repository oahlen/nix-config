{
  config,
  hm-modules,
  pkgs,
  user,
  ...
}: {
  imports = [
    "${hm-modules}/programs/bash"
    "${hm-modules}/programs/bat"
    "${hm-modules}/programs/bottom"
    "${hm-modules}/programs/dconf"
    "${hm-modules}/programs/direnv"
    "${hm-modules}/programs/fd"
    "${hm-modules}/programs/fish"
    "${hm-modules}/programs/fzf"
    "${hm-modules}/programs/git"
    "${hm-modules}/programs/gitui"
    "${hm-modules}/programs/ideavim"
    "${hm-modules}/programs/jq"
    "${hm-modules}/programs/navi"
    "${hm-modules}/programs/neovim"
    "${hm-modules}/programs/ssh"
    "${hm-modules}/programs/tmux"
    "${hm-modules}/programs/yazi"
    "${hm-modules}/scripts"
    ./modules/font.nix
  ];

  # Enable home-manager
  programs.home-manager.enable = true;

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # Disable news notification for home-manager
  news.display = "silent";

  # Nixpkgs settings
  nixpkgs.config.allowUnfree = true;

  # Nix settings
  nix = {
    gc = {
      automatic = true;
      frequency = "weekly";
      options = "--delete-older-than 14d";
    };
  };

  # Nix index
  programs.nix-index.enable = true;

  # XDG settings
  xdg = {
    enable = true;
    userDirs = {
      enable = true;
      createDirectories = true;
    };
  };

  # Home-Manager configuration for the user's home environment
  home = {
    username = "${user.name}";
    homeDirectory = "/home/${user.name}";

    # Session variables
    sessionVariables = {
      AWS_CONFIG_FILE = "${config.home.sessionVariables.XDG_CONFIG_HOME}/aws/config";
      AWS_SHARED_CREDENTIALS_FILE = "${config.home.sessionVariables.XDG_CONFIG_HOME}/aws/credentials";
      CALCHISTFILE = "${config.home.sessionVariables.XDG_CACHE_HOME}/calc_history";
      CARGO_HOME = "${config.home.sessionVariables.XDG_DATA_HOME}/cargo";
      DOTNET_CLI_HOME = "${config.home.sessionVariables.XDG_DATA_HOME}/dotnet";
      FLAKE = "${config.home.homeDirectory}/nix-config";
      LESSHISTFILE = "${config.home.sessionVariables.XDG_DATA_HOME}/less/history";
      MANPAGER = "less -R --use-color -Dd+b -Du+G -DP+kb -DS+ky";
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

    pointerCursor = {
      name = "Adwaita";
      package = pkgs.adwaita-icon-theme;
      gtk.enable = true;
      x11.enable = true;
      size = 24;
    };

    packages = with pkgs; [
      calc
      dogdns
      dos2unix
      du-dust
      figlet
      hexyl
      jless
      pokeget-rs
      procs
      rage
      scooter
      sd
      tokei
    ];
  };

  # Default programs
  programs = {
    eza.enable = true;
    fastfetch.enable = true;
    ripgrep.enable = true;
    zoxide.enable = true;
  };
}
