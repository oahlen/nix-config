{
  customPackages,
  pkgs,
  ...
}: {
  # Language servers and tools
  home.packages = with pkgs; [
    customPackages.nixvim
    alejandra
    nixd
    nix-prefetch-git
    nix-search-cli
    nodePackages.svelte-language-server
    nodePackages.typescript-language-server
    nodePackages.vscode-langservers-extracted
    pyright
    shellcheck
    stylua
    sumneko-lua-language-server
    typos
  ];
}
