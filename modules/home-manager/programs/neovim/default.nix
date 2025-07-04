{
  customPackages,
  pkgs,
  ...
}: {
  # Language servers and tools
  home.packages = with pkgs; [
    customPackages.nixvim-full
    alejandra
    nix-prefetch-git
    nix-search-cli
    stylua
    typos
  ];
}
