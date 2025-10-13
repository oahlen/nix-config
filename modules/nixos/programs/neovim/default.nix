{
  customPackages,
  pkgs,
  ...
}: let
  arch = pkgs.stdenv.hostPlatform.system;
in {
  # Language servers and tools
  environment.systemPackages = with pkgs; [
    customPackages.${arch}.nixvim-full
    alejandra
    stylua
    typos
  ];
}
