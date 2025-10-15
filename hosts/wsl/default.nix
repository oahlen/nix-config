{
  pkgs,
  user,
  ...
}: {
  # Since we don't have a hardware-configuration.nix
  nixpkgs.hostPlatform = "x86_64-linux";

  wsl = {
    enable = true;
    defaultUser = "${user.name}";
    useWindowsDriver = true;
  };

  modules = {
    development.enable = true;

    virtualisation = {
      apptainer.enable = true;
      podman.enable = true;
    };
  };

  services.timesyncd.enable = true;

  programs = {
    git.lfs.enable = true;
    ssh.startAgent = true;
  };

  environment.systemPackages = with pkgs; [
    # awscli2 # Currently broken
    _1password-cli
    duckdb
    hyperfine
    nodejs # For Github Copilot
    pqrs
    qsv
    typst
    wl-clipboard
    xdg-utils
  ];

  system.stateVersion = "24.11";
}
