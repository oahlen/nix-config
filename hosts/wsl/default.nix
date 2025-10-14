{
  nixos-modules,
  pkgs,
  user,
  ...
}: {
  imports = [
    "${nixos-modules}/programs/apptainer"
    "${nixos-modules}/programs/podman"
  ];

  # Since we don't have a hardware-configuration.nix
  nixpkgs.hostPlatform = "x86_64-linux";

  modules.development.enable = true;

  wsl = {
    enable = true;
    defaultUser = "${user.name}";
    useWindowsDriver = true;
  };

  programs.git.lfs.enable = true;
  programs.ssh.startAgent = true;

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

  services.timesyncd.enable = true;

  system.stateVersion = "24.11";
}
