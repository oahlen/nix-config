{pkgs, ...}: {
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
