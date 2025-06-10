{pkgs, ...}: {
  home.packages = with pkgs; [
    tmux
    tmuxp
  ];

  xdg.configFile."tmux/tmux.conf".source = ./tmux.conf;

  xdg.configFile."tmuxp" = {
    source = ./tmuxp;
    recursive = true;
  };
}
