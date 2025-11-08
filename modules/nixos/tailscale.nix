{
  config,
  lib,
  ...
}:
with lib;
let
  cfg = config.modules.tailscale;
in
{
  options.modules.tailscale.enable = mkEnableOption "Whether to enable Tailscale.";

  config = mkIf cfg.enable {
    services.tailscale.enable = true;

    networking.firewall.checkReversePath = "loose";
  };
}
