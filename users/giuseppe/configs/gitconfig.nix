{
  inputs,
  lib,
  config,
  ...
}: {
  programs.git = {
    enable = true;
    userName = "giu7d";
    userEmail = "giuseppe7d@gmail.com";
    ignores = [
      "node_modules"
    ];
  };
}
