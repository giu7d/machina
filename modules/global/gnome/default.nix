{
  config,
  pkgs,
  lib,
  ...
}: {
  environment.gnome.excludePackages = with pkgs; [
    epiphany # web browser
    totem # video player
    seahorse # password manager
    yelp # help
    gnome-tour
    gnome-logs
    gnome-maps
  ];
}
