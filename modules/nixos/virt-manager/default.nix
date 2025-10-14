{
  config,
  lib,
  pkgs,
  user,
  ...
}:
with lib; let
  cfg = config.modules.virt-manager;
in {
  options.modules.virt-manager.enable = mkEnableOption "Enable virt-manager";

  config = mkIf cfg.enable {
    virtualisation.libvirtd.enable = true;

    programs.dconf.enable = true;

    environment.systemPackages = with pkgs; [
      virt-manager
    ];

    users.users.${user.name} = {
      extraGroups = ["libvirtd"];
    };
  };
}
