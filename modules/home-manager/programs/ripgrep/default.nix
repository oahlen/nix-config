{...}: {
  programs.ripgrep = {
    enable = true;
    arguments = [
      "--hidden"
      "--glob"
      "!.cache/"
      "!.dotnet/"
      "!.git/"
      "!.mozilla/"
    ];
  };
}
