{
  pkgs,
  user,
  ...
}:
{
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
    dconf.enable = true;
    git.lfs.enable = true;
    ssh.startAgent = true;
  };

  environment.systemPackages = with pkgs; [
    # awscli2 # Currently broken
    duckdb
    hyperfine
    nodejs # For Github Copilot
    pqrs
    qsv
    ruff
    typst
    wl-clipboard
    xdg-utils
  ];

  system.stateVersion = "24.11";
}
