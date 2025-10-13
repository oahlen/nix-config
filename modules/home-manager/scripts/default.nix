{config, ...}: {
  home.sessionPath = [
    "${config.home.sessionVariables.XDG_CONFIG_HOME}/scripts"
  ];
}
