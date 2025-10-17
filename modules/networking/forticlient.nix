{
  config,
  lib,
  pkgs,
  ...
}:
with lib;
let
  cfg = config.modules.networking.forticlient;
in
{
  options.modules.networking.forticlient.enable = mkEnableOption "Whether to enable Forticlient.";

  config = mkIf cfg.enable {
    services.pppd.enable = true;

    # Workaround for openfortivpn
    environment.etc."ppp/options".text = ''
      ipcp-accept-local
      ipcp-accept-remote
    '';

    environment.systemPackages = with pkgs; [
      openfortivpn
    ];
  };
}
