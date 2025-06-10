{
  pkgs,
  user,
  ...
}: {
  virtualisation.libvirtd = {
    enable = true;
    qemu.ovmf.enable = true;
  };
  programs.dconf.enable = true;

  environment.systemPackages = with pkgs; [
    virt-manager
  ];

  users.users.${user.name} = {
    extraGroups = ["libvirtd"];
  };
}
