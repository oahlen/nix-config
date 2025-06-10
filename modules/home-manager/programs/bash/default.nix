{...}: {
  programs.bash = {
    enable = true;

    initExtra = ''
      set +o history
      PS1='[\u@\h \W]\$ '
    '';

    shellAliases = {
      ".." = "cd ..";
    };

    historyIgnore = [
      "ls"
      "cd"
      "exit"
    ];
  };
}
