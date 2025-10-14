{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.modules.podman;
in {
  options.modules.podman.enable = mkEnableOption "Enable podman";

  config = mkIf cfg.enable {
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
  };
}
