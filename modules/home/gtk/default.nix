{
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [
    ./extensions.nix
    ./theme.nix
  ];

  dconf.settings = {
    #
    # Setup title bar buttons
    #
    "org/gnome/desktop/wm/preferences" = {
      button-layout = ":minimize,maximize,close";
    };
  };
}
