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

    delta = {
      enable = true;

      options = {
        navigate = "true";
        side-by-side = "true";
        syntax-theme = "base16";
        file-modified-label = "changed:";
        file-style = "cyan";
        file-decoration-style = "brightblack ul";
        hunk-header-style = "line-number syntax";
        hunk-header-decoration-style = "brightblack box";
        hunk-header-file-style = "white";
        hunk-header-line-number-style = "white";
        minus-style = "#ceb0b6 #53343b";
        minus-non-emph-style = "#ceb0b6 #53343b";
        minus-emph-style = "black red";
        minus-empty-line-marker-style = "#ceb0b6 #53343b";
        plus-style = "#c0c5b9 #45493e";
        plus-non-emph-style = "#c0c5b9 #45493e";
        plus-emph-style = "black green";
        plus-empty-line-marker-style = "#c0c5b9 #45493e";
        line-numbers-minus-style = "white #53343b";
        line-numbers-plus-style = "white #45493e";
        line-numbers-zero-style = "brightblack";
        line-numbers-left-style = "brightblack";
        line-numbers-right-style = "brightblack";
      };
    };
  };
}
