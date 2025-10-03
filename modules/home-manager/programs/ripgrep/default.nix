{...}: {
  programs.ripgrep = {
    enable = true;
    arguments = [
      "--hidden"
      "--glob"
      "!.cache/"
      "--glob"
      "!.dotnet/"
      "--glob"
      "!.git/"
      "--glob"
      "!.mozilla/"
    ];
  };
}
