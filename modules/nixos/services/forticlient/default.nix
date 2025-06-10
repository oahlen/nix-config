{pkgs, ...}: {
  services.pppd.enable = true;

  # Workaround for openfortivpn
  environment.etc."ppp/options".text = ''
    ipcp-accept-local
    ipcp-accept-remote
  '';

  environment.systemPackages = with pkgs; [
    openfortivpn
  ];
}
