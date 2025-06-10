{config, ...}: {
  programs.navi = {
    enable = true;

    settings = {
      style = {
        tag.color = "blue";
        comment.color = "cyan";
        snippet.color = "white";
      };

      cheats = {
        paths = [
          "${config.home.homeDirectory}/cheats/"
        ];
      };
    };
  };
}
