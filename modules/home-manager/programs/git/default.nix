{
  config,
  user,
  ...
}: {
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

      options = let
        added_bg = config.colorscheme.diff.added_bg;
        deleted_bg = config.colorscheme.diff.deleted_bg;
      in {
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
        minus-style = "syntax ${deleted_bg}";
        minus-non-emph-style = "syntax ${deleted_bg}";
        minus-emph-style = "black red";
        minus-empty-line-marker-style = "syntax ${deleted_bg}";
        plus-style = "syntax ${added_bg}";
        plus-non-emph-style = "syntax ${added_bg}";
        plus-emph-style = "black green";
        plus-empty-line-marker-style = "syntax ${added_bg}";
        line-numbers-minus-style = "syntax ${deleted_bg}";
        line-numbers-plus-style = "syntax ${added_bg}";
        line-numbers-zero-style = "brightblack";
        line-numbers-left-style = "brightblack";
        line-numbers-right-style = "brightblack";
      };
    };
  };
}
