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

        "text/plain" = ["org.gnome.TextEditor.desktop"];

        "application/x-extension-htm" = ["firefox.desktop"];
        "application/x-extension-html" = ["firefox.desktop"];
        "application/x-extension-shtml" = ["firefox.desktop"];
        "application/x-extension-xht" = ["firefox.desktop"];
        "application/x-extension-xhtml" = ["firefox.desktop"];
        "application/xhtml+xml" = ["firefox.desktop"];
        "text/html" = ["firefox.desktop"];
        "x-scheme-handler/chrome" = ["firefox.desktop"];
        "x-scheme-handler/http" = ["firefox.desktop"];
        "x-scheme-handler/https" = ["firefox.desktop"];

        "image/jpeg" = ["org.gnome.Loupe.desktop"];
        "image/png" = ["org.gnome.Loupe.desktop"];
      };
      defaultApplications = {
        "inode/directory" = ["org.gnome.Nautilus.desktop"];

        "text/plain" = ["org.gnome.TextEditor.desktop"];

        "application/x-extension-htm" = ["firefox.desktop"];
        "application/x-extension-html" = ["firefox.desktop"];
        "application/x-extension-shtml" = ["firefox.desktop"];
        "application/x-extension-xht" = ["firefox.desktop"];
        "application/x-extension-xhtml" = ["firefox.desktop"];
        "application/xhtml+xml" = ["firefox.desktop"];
        "text/html" = ["firefox.desktop"];
        "x-scheme-handler/chrome" = ["firefox.desktop"];
        "x-scheme-handler/http" = ["firefox.desktop"];
        "x-scheme-handler/https" = ["firefox.desktop"];

        "image/jpeg" = ["org.gnome.Loupe.desktop"];
        "image/png" = ["org.gnome.Loupe.desktop"];
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
