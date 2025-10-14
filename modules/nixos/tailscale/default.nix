{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.modules.tailscale;
in {
  options.modules.tailscale.enable = mkEnableOption "Enable tailscale";

  config = mkIf cfg.enable {
    services.tailscale.enable = true;

    networking.firewall.checkReversePath = "loose";
  };
}
