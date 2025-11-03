{
  makeWrapper,
  pkgs,
  symlinkJoin,
  ...
}:
symlinkJoin {
  name = "stylua";
  paths = with pkgs; [
    stylua
  ];
  nativeBuildInputs = [ makeWrapper ];
  postBuild = ''
    wrapProgram $out/bin/stylua \
      --add-flags '-f' \
      --add-flags "${./stylua.toml}"
  '';
}
