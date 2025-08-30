{
  inputs,
  lib,
  config,
  ...
}: {
  # TODO: understand how to use secrets
  # age.secrets.gitIncludes = {
  #   file = "${inputs.secrets}/gitIncludes.age";
  #   path = "$HOME/.config/git/includes";
  # };

  programs.git = {
    enable = true;
    userName = "giu7d";
    userEmail = "giuseppe7d@gmail.com";
  };
}
