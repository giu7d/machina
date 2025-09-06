{
  lib,
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    jetbrains-mono
  ];

  fonts.fontconfig.enable = true;
}
