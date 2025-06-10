{...}: {
  programs.fd = {
    enable = true;
    ignores = [
      ".cache/"
      ".dotnet/"
      ".git/"
      ".mozilla/"
    ];
  };
}
