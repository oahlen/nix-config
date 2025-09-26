{
  pkgs,
  user,
  ...
}: {
  # Common Desktop applications and settings

  environment.systemPackages = with pkgs; [
    gnome-multi-writer
    gnome-text-editor
    loupe
    nautilus
  ];

  services.dbus = {
    enable = true;
    packages = with pkgs; [gcr_4];
  };

  users.users.${user.name} = {
    extraGroups = ["audio" "video"];
  };

  programs.gnome-disks.enable = true;

  services.gvfs.enable = true;
  services.tumbler.enable = true;
}
