{user, ...}: {
  imports = [
    ./common
    ./scripts
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

    mimeApps = {
      enable = true;
      associations.added = {
        "inode/directory" = ["org.gnome.Nautilus.desktop"];
        "image/png" = ["org.gnome.Loupe.desktop"];
        "image/jpeg" = ["org.gnome.Loupe.desktop"];
        "text/plain" = ["org.gnome.TextEditor.desktop"];
      };
      defaultApplications = {
        "inode/directory" = ["org.gnome.Nautilus.desktop"];
        "image/png" = ["org.gnome.Loupe.desktop"];
        "image/jpeg" = ["org.gnome.Loupe.desktop"];
        "text/plain" = ["org.gnome.TextEditor.desktop"];
      };
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
