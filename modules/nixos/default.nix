{user, ...}: {
  # Nixpkgs settings
  nixpkgs.config.allowUnfree = true;

  # Boot settings
  boot = {
    kernel.sysctl = {
      "vm.swappiness" = 10;
      "vm.vfs_cache_pressure" = 50;
      "vm.max_map_count" = 16777216;
    };

    loader.efi.canTouchEfiVariables = true;
  };

  # Hardware settings
  hardware = {
    enableAllFirmware = true;
    enableRedistributableFirmware = true;
  };

  # Timezone
  time.timeZone = "Europe/Stockholm";

  # Input settings
  console.keyMap = "sv-latin1";

  # Internationalization
  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = "sv_SE.UTF-8";
      LC_IDENTIFICATION = "sv_SE.UTF-8";
      LC_MEASUREMENT = "sv_SE.UTF-8";
      LC_MONETARY = "sv_SE.UTF-8";
      LC_NAME = "sv_SE.UTF-8";
      LC_NUMERIC = "sv_SE.UTF-8";
      LC_PAPER = "sv_SE.UTF-8";
      LC_TELEPHONE = "sv_SE.UTF-8";
      LC_TIME = "sv_SE.UTF-8";
    };
  };

  # Security settings
  security = {
    sudo.enable = false;
    sudo-rs.enable = true;
  };

  # Systemd settings
  services.journald.extraConfig = ''
    SystemMaxUse=100M
  '';

  # Nix settings
  nix = {
    channel.enable = false;

    settings = {
      auto-optimise-store = true;
      experimental-features = "nix-command flakes";
      use-xdg-base-directories = false;
    };

    extraOptions = ''
      keep-outputs = true
      keep-derivations = true
    '';

    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 14d";
    };
  };

  # User configuration
  users.users.${user.name} = {
    uid = 1000;
    description = user.fullName;
    isNormalUser = true;
    extraGroups = ["wheel"];
  };

  # Session variables
  environment.sessionVariables = {
    _JAVA_AWT_WM_NONREPARENTING = "1";
    NIXOS_OZONE_WL = "1";
    QT_QPA_PLATFORM = "wayland";
    QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
    SDL_VIDEODRIVER = "wayland";
  };

  # General overrides
  services.dbus.implementation = "broker";

  # Enable dconf system wide
  programs.dconf.enable = true;
}
