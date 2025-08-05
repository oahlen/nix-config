{
  nixos-modules,
  user,
  ...
}: {
  imports = [
    "${nixos-modules}/profiles/terminal"
    "${nixos-modules}/programs/apptainer"
    "${nixos-modules}/programs/podman"
  ];

  # Since we don't have a hardware-configuration.nix
  nixpkgs.hostPlatform = "x86_64-linux";

  wsl = {
    enable = true;
    defaultUser = "${user.name}";
    useWindowsDriver = true;
  };

  programs.ssh.startAgent = true;

  services.timesyncd.enable = true;

  system.stateVersion = "24.11";
}
