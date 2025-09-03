{
  config,
  pkgs,
  ...
}: {
  home.username = "giuseppe";
  home.homeDirectory = "/home/giuseppe";

  home.stateVersion = "25.05";

  home.packages = [];

  home.file = {};

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  programs.home-manager.enable = true;
}
