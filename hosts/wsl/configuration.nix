{
  config,
  pkgs,
  ...
}:
{
  # Since we don't have a hardware-configuration.nix
  nixpkgs.hostPlatform = "x86_64-linux";

  wsl = {
    enable = true;
    defaultUser = config.user.name;
    useWindowsDriver = true;
  };

  modules.virtualisation = {
    apptainer.enable = true;
    podman.enable = true;
  };

  services.timesyncd.enable = true;

  programs = {
    dconf.enable = true;
    git.lfs.enable = true;
    ssh.startAgent = true;
  };

  environment.systemPackages =
    with pkgs;
    [
      awscli2
      duckdb
      fastfetchMinimal
      hyperfine
      nodejs # For Github Copilot
      pqrs
      qsv
      ruff
      trash-cli
      typst
      wl-clipboard
      xdg-utils
    ]
    ++ (import ../packages.nix pkgs);

  system.stateVersion = "24.11";
}
