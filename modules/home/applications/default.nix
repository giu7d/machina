{
  lib,
  config,
  pkgs,
  ...
}: {
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.allowUnfreePredicate = true;
  #
  # Setup User Packages
  #
  home.packages = with pkgs; [
    alejandra
    vscode
    gh
    dconf-editor
    gnome-software
  ];
}
