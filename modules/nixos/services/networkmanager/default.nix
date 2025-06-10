{user, ...}: {
  networking = {
    useDHCP = false;

    wireless.iwd.enable = true;

    networkmanager = {
      enable = true;
      wifi.backend = "iwd";
    };
  };

  users.users.${user.name} = {
    extraGroups = ["networkmanager"];
  };
}
