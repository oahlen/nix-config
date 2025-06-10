{
  lib,
  makeWrapper,
  neovim-unwrapped,
  pkgs,
  runCommandLocal,
  symlinkJoin,
  ...
}: let
  packageName = "nixvim";

  startPlugins = import ./plugins {inherit pkgs;};

  foldPlugins = builtins.foldl' (
    acc: next:
      acc
      ++ [
        next
      ]
      ++ (foldPlugins (next.dependencies or []))
  ) [];

  startPluginsWithDeps = lib.unique (foldPlugins startPlugins);

  packpath = runCommandLocal "packpath" {} ''
    mkdir -p $out/pack/${packageName}/{start,opt}

    ln -vsfT ${./start-plugin} $out/pack/${packageName}/start/start-plugin

    ${
      lib.concatMapStringsSep
      "\n"
      (plugin: "ln -vsfT ${plugin} $out/pack/${packageName}/start/${lib.getName plugin}")
      startPluginsWithDeps
    }
  '';
in
  symlinkJoin {
    name = "nvim";

    paths = [neovim-unwrapped];

    nativeBuildInputs = [makeWrapper];

    postBuild = ''
      wrapProgram $out/bin/nvim \
        --add-flags '-u' \
        --add-flags 'NORC' \
        --add-flags '--cmd' \
        --add-flags "'set packpath^=${packpath} | set runtimepath^=${packpath}'" \
        --set-default NVIM_APPNAME nixvim
    '';

    passthru = {
      inherit packpath;
    };
  }
