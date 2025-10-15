{
  config,
  lib,
  pkgs,
  user,
  ...
}:
with lib; let
  cfg = config.modules.desktop;
in {
  imports = [
    ./gnome.nix
    ./niri.nix
    ./sway.nix
  ];

  options.modules.desktop.enable = mkEnableOption "Enable desktop specific options";

  config = mkIf cfg.enable {
    # Plymouth boot screen
    boot = {
      plymouth.enable = true;

      consoleLogLevel = 3;
      initrd.verbose = false;
      initrd.systemd.enable = true;

      kernelParams = [
        "quiet"
        "splash"
        "intremap=on"
        "boot.shell_on_fail"
        "udev.log_priority=3"
        "rd.systemd.show_status=auto"
      ];
    };

    # Networkmanager
    networking = {
      useDHCP = false;

      wireless.iwd.enable = true;

      networkmanager = {
        enable = true;
        wifi.backend = "iwd";
      };
    };

    programs.nm-applet.enable = true;

    users.users.${user.name} = {
      extraGroups = ["networkmanager"];
    };

    # Pipewire
    services = {
      pipewire = {
        enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
        pulse.enable = true;
      };

      pulseaudio.enable = false;
    };

    security.rtkit.enable = true;

    # Fonts
    fonts.packages = with pkgs; [
      dejavu_fonts
      liberation_ttf
      nerd-fonts.jetbrains-mono
      noto-fonts-emoji
    ];
  };
}
