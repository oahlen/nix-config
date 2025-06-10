{
  customPackages,
  nixpkgs,
  system,
  ...
}: let
  pkgs = import nixpkgs {inherit system;};
in
  pkgs.mkShell {
    NIX_SHELL = "Default";

    buildInputs = with pkgs; [
      alejandra
      bashInteractive
      bottom
      gitui
      customPackages.nixvim
      (symlinkJoin
        {
          name = "tmux";
          paths = [tmux fish];
          buildInputs = [makeWrapper];
          postBuild = ''
            wrapProgram $out/bin/tmux \
              --set SHELL ${pkgs.lib.getExe pkgs.fish} \
              --add-flags "-f ${./../modules/home-manager/programs/tmux/tmux.conf}"
          '';
        })
    ];

    shellHook = ''
      exec fish
    '';
  }
