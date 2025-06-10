{pkgs, ...}:
with pkgs; let
  # Create an rbw wrapper with pinentry-gnome3 accessible
  wrapped-rbw = symlinkJoin {
    name = "rbw";
    paths = [pinentry-gnome3 rbw];
    buildInputs = [makeWrapper];
    postBuild = ''
      wrapProgram $out/bin/rbw
    '';
  };
in {
  home.packages = [wrapped-rbw];
}
