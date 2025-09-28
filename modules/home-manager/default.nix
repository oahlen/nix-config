{
  pkgs,
  user,
  ...
}: {
  imports = [
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
      dates = "weekly";
      options = "--delete-older-than 14d";
    };
  };

  # Nix index
  programs.nix-index.enable = true;

  # Nix tooling
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  home.packages = with pkgs; [
    nix-tree
    nix-prefetch-git
    nix-search-cli
  ];

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

        "application/x-extension-htm" = ["org.mozilla.firefox.desktop"];
        "application/x-extension-html" = ["org.mozilla.firefox.desktop"];
        "application/x-extension-shtml" = ["org.mozilla.firefox.desktop"];
        "application/x-extension-xht" = ["org.mozilla.firefox.desktop"];
        "application/x-extension-xhtml" = ["org.mozilla.firefox.desktop"];
        "application/xhtml+xml" = ["org.mozilla.firefox.desktop"];
        "text/html" = ["org.mozilla.firefox.desktop"];
        "x-scheme-handler/chrome" = ["org.mozilla.firefox.desktop"];
        "x-scheme-handler/http" = ["org.mozilla.firefox.desktop"];
        "x-scheme-handler/https" = ["org.mozilla.firefox.desktop"];

        "image/jpeg" = ["org.gnome.Loupe.desktop"];
        "image/png" = ["org.gnome.Loupe.desktop"];
      };
      defaultApplications = {
        "inode/directory" = ["org.gnome.Nautilus.desktop"];

        "text/plain" = ["org.gnome.TextEditor.desktop"];

        "application/x-extension-htm" = ["org.mozilla.firefox.desktop"];
        "application/x-extension-html" = ["org.mozilla.firefox.desktop"];
        "application/x-extension-shtml" = ["org.mozilla.firefox.desktop"];
        "application/x-extension-xht" = ["org.mozilla.firefox.desktop"];
        "application/x-extension-xhtml" = ["org.mozilla.firefox.desktop"];
        "application/xhtml+xml" = ["org.mozilla.firefox.desktop"];
        "text/html" = ["org.mozilla.firefox.desktop"];
        "x-scheme-handler/chrome" = ["org.mozilla.firefox.desktop"];
        "x-scheme-handler/http" = ["org.mozilla.firefox.desktop"];
        "x-scheme-handler/https" = ["org.mozilla.firefox.desktop"];

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

  # Disable man pages
  programs.man.enable = false;
}
