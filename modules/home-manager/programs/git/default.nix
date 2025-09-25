{user, ...}: {
  programs.git = {
    enable = true;

    userName = user.fullName;

    extraConfig = {
      core = {
        editor = "nvim";
        eol = "lf";
        autocrlf = "input";
      };

      init = {
        defaultBranch = "main";
      };

      pull = {
        rebase = "true";
      };

      push = {
        autoSetupRemote = "true";
      };
    };

    aliases = {
      c = "commit";
      s = "status";
      sw = "switch";
      br = "branch";
      tree = "log --graph --decorate --oneline";
    };
  };
}
