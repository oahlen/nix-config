{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.modules.apptainer;
in {
  options.modules.apptainer.enable = mkEnableOption "Enable apptainer";

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
