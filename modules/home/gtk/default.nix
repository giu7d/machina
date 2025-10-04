{config, ...}: {
  imports = [
    ./extensions.nix
    ./theme.nix
    ./keybinds.nix
  ];

  dconf.settings = {
    # Setup title bar buttons
    "org/gnome/desktop/wm/preferences" = {
      button-layout = ":minimize,maximize,close";
    };
    # Setup center new windows
    "org/gnome/mutter" = {
      center-new-windows = true;
    };
  };
}
