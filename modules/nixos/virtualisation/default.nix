{
  config,
  lib,
  pkgs,
  user,
  ...
}:
with lib; let
  cfg = config.modules.virtualisation;
in {
  options.modules.virtualisation = {
    apptainer.enable = mkEnableOption "Enable Apptainer";
    podman.enable = mkEnableOption "Enable Podman";
    virt-manager.enable = mkEnableOption "Enable Virtual Machine Manager";
  };

  config =
    mkIf cfg.apptainer.enable {
      programs.singularity = {
        enable = true;
        package = pkgs.apptainer;
      };

      environment.systemPackages = with pkgs; [
        gocryptfs
      ];
    }
    // mkIf cfg.podman.enable {
      virtualisation.podman = {
        enable = true;

        autoPrune = {
          enable = true;
          flags = ["--all"];
          dates = "weekly";
        };

        dockerCompat = true;
        defaultNetwork.settings.dns_enabled = true;
      };

      environment.systemPackages = with pkgs; [
        podman-compose
      ];
    }
    // mkIf cfg.virt-manager.enable {
      virtualisation.libvirtd.enable = true;

      programs.dconf.enable = true;

      environment.systemPackages = with pkgs; [
        virt-manager
      ];

      users.users.${user.name} = {
        extraGroups = ["libvirtd"];
      };
    };
}
