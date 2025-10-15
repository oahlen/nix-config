{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.modules.networking.tailscale;
in {
  options.modules.networking.tailscale.enable = mkEnableOption "Enable tailscale";

  config = mkIf cfg.enable {
    services.tailscale.enable = true;

    networking.firewall.checkReversePath = "loose";
  };
}
