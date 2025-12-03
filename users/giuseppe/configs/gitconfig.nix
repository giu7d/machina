{
  inputs,
  lib,
  config,
  ...
}: {
  programs.git = {
    enable = true;
    ignores = [
      "node_modules"
    ];
    settings = {
      user = {
        name = "giu7d";
        email = "giuseppe7d@gmail.com";
      };
    };
  };
}
