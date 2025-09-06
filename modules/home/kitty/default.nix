{
  lib,
  config,
  pkgs,
  ...
}: {
  #
  # Install Kitty Packages
  #
  home.packages = with pkgs; [
    kitty
  ];

  #
  # Setup Kitty
  #
  programs.kitty = {
    enable = true;
    extraConfig = ''
      ${builtins.readFile ./files/window.conf}
      ${builtins.readFile ./files/fonts.conf}
      ${builtins.readFile ./files/colors.conf}
    '';
  };
}
