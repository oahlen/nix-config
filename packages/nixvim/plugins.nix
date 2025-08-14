{pkgs}:
with pkgs.vimPlugins;
  [
    cmp-buffer
    cmp_luasnip
    cmp-nvim-lsp
    cmp-nvim-lua
    cmp-path
    comment-nvim
    conform-nvim
    CopilotChat-nvim
    copilot-lua
    friendly-snippets
    gitsigns-nvim
    heirline-nvim
    indent-blankline-nvim
    luasnip
    lz-n
    nvim-autopairs
    nvim-cmp
    nvim-colorizer-lua
    nvim-lspconfig
    nvim-surround
    nvim-tree-lua
    nvim-web-devicons
    omnisharp-extended-lsp-nvim
    render-markdown-nvim
    telescope-fzf-native-nvim
    telescope-nvim
    telescope-ui-select-nvim
    which-key-nvim
    (nvim-treesitter.withPlugins (plugins:
      with plugins; [
        angular
        awk
        bash
        c
        cmake
        comment
        cpp
        c_sharp
        css
        desktop
        diff
        dockerfile
        editorconfig
        fish
        fsharp
        gitattributes
        gitcommit
        git_config
        gitignore
        git_rebase
        go
        gpg
        helm
        html
        http
        java
        javadoc
        javascript
        jinja
        jinja_inline
        jq
        json
        json5
        jsonc
        kdl
        kotlin
        latex
        lua
        luadoc
        make
        markdown
        markdown_inline
        mermaid
        nginx
        nix
        pem
        powershell
        properties
        proto
        python
        query
        r
        regex
        ron
        rust
        scss
        sql
        ssh_config
        svelte
        sway
        tmux
        todotxt
        toml
        typescript
        vim
        vimdoc
        xml
        yaml
      ]))
  ]
  ++ [
    (
      pkgs.vimUtils.buildVimPlugin {
        pname = "shellcheck-nvim";
        version = "1.0.0";
        src = pkgs.fetchFromGitHub {
          owner = "pablos123";
          repo = "shellcheck.nvim";
          rev = "ee40e705ea61a4d790907c93cd01cc52480351fa";
          sha256 = "sha256-1rfEtD+II1uh6cn/dBxwGKxNFUwgoKXWtcJHIi6ydy4=";
        };

        meta.homepage = "https://github.com/pablos123/shellcheck.nvim";
      }
    )
    (
      pkgs.vimUtils.buildVimPlugin {
        pname = "tokyonight-nvim";
        version = "1.0.0";
        src = pkgs.fetchFromGitHub {
          owner = "oahlen";
          repo = "tokyonight.nvim";
          rev = "3bf65cb4ab6a00e4e7898256f9e483cdbd7775b4";
          sha256 = "sha256-H6TNyUg9MmtPaDEUUget5gkrrIdEDmyvbx1vR520ckM=";
        };

        meta.homepage = "https://github.com/oahlen/tokyonight.nvim";
      }
    )
  ]
