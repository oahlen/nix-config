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
        minus-style = "syntax #433347";
        minus-non-emph-style = "syntax #433347";
        minus-emph-style = "black red";
        minus-empty-line-marker-style = "syntax #433347";
        plus-style = "syntax #364042";
        plus-non-emph-style = "syntax #364042";
        plus-emph-style = "black green";
        plus-empty-line-marker-style = "syntax #364042";
        line-numbers-minus-style = "syntax #433347";
        line-numbers-plus-style = "syntax #364042";
        line-numbers-zero-style = "brightblack";
        line-numbers-left-style = "brightblack";
        line-numbers-right-style = "brightblack";
      };
    };
  };
}
