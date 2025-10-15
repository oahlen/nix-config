{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.modules.virtualisation.apptainer;
in {
  options.modules.virtualisation.apptainer.enable = mkEnableOption "Enable Apptainer";

  config = mkIf cfg.enable {
    programs.singularity = {
      enable = true;
      package = pkgs.apptainer;
    };

    environment.systemPackages = with pkgs; [
      gocryptfs
    ];
  };
}
