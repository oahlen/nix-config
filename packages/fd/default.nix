{
  fd,
  makeWrapper,
  symlinkJoin,
}:

symlinkJoin {
  name = "fd";
  paths = [ fd ];
  nativeBuildInputs = [ makeWrapper ];
  postBuild = ''
    wrapProgram $out/bin/fd \
      --add-flags '--ignore-file' \
      --add-flags "${./ignore}"
  '';
}
