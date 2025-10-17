{
  config,
  lib,
  pkgs,
  user,
  ...
}:
with lib;
let
  cfg = config.modules.virtualisation.virt-manager;
in
{
  options.modules.virtualisation.virt-manager.enable =
    mkEnableOption "Whether to enable Virtual Machine Manager.";

  config = mkIf cfg.enable {
    virtualisation.libvirtd.enable = true;

    programs.dconf.enable = true;

    environment.systemPackages = with pkgs; [
      virt-manager
    ];

    users.users.${user.name} = {
      extraGroups = [ "libvirtd" ];
    };
  };
}
