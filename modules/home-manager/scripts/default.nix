{config, ...}: {
  xdg.configFile."scripts" = {
    source = ./.;
    recursive = true;
  };

  home.sessionPath = [
    "${config.home.sessionVariables.XDG_CONFIG_HOME}/scripts"
  ];
}
