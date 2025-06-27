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

  wsl = {
    enable = true;
    defaultUser = "${user.name}";
    useWindowsDriver = true;
  };

  programs.ssh.startAgent = true;

  # Keep until this issue is resolved https://github.com/nix-community/NixOS-WSL/issues/650
  # Prevent systemd from mounting a tmpfs over the runtime dir (and thus hiding the wayland socket)
  systemd.services."user-runtime-dir@" = {
    overrideStrategy = "asDropin";

    serviceConfig.ExecStart = [
      "" # unset old value
      "${pkgs.coreutils}/bin/true"
    ];
  };

  services.timesyncd.enable = true;

  programs.dconf.enable = true; # Needed by home-manager ...

  system.stateVersion = "24.11";
}
