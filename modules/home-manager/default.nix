{user, ...}: {
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
      dates = "weekly";
      options = "--delete-older-than 14d";
    };
  };

  # Nix tooling
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

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
  };

  # Enable dconf
  dconf.enable = true;
}
