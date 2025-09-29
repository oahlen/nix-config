{pkgs}:
with pkgs.vimPlugins;
  [
    blink-cmp
    comment-nvim
    conform-nvim
    CopilotChat-nvim
    copilot-lua
    friendly-snippets
    fzf-lua
    gitsigns-nvim
    heirline-nvim
    indent-blankline-nvim
    luasnip
    lz-n
    nvim-autopairs
    nvim-colorizer-lua
    nvim-lspconfig
    nvim-surround
    nvim-tree-lua
    nvim-web-devicons
    omnisharp-extended-lsp-nvim
    render-markdown-nvim
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
        typst
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
          rev = "170026841c2d59ae4cae42b72efb9873b28b34b2";
          sha256 = "sha256-df3cKI9Esu0v9AHnPZ6IH536xwZ6hFHlSvr4+4x179Y=";
        };

        meta.homepage = "https://github.com/oahlen/tokyonight.nvim";
      }
    )
  ]
