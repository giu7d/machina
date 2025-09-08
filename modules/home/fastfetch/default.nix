{
  config,
  pkgs,
  ...
}: {
  programs.fastfetch = {
    enable = true;
    settings = {
      modules = [
        "title"
        "os"
        "kernel"
        "packages"
        "shell"
        "wm"
        "cpu"
        "gpu"
        "memory"
        "disk"
        "colors"
      ];
      logo = {
        source = "${config.home.homeDirectory}/.config/fastfetch/rose.txt";
      };
    };
  };

  home.file.".config/fastfetch/rose.txt".source = ./files/rose.txt;
}
