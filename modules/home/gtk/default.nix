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
    # Setup title bar buttons
    "org/gnome/desktop/wm/preferences" = {
      button-layout = ":minimize,maximize,close";
    };
    # Setup center new windows
    "org/gnome/mutter" = {
      center-new-windows = true;
    };
  };

  # xdg = {
  #   mimeApps.enable = true;
  #   mimeApps.defaultApplications = {
  #     # Setup default browser
  #     "text/html" = "app.zen_browser.zen.desktop";
  #     "x-scheme-handler/http" = "app.zen_browser.zen.desktop";
  #     "x-scheme-handler/https" = "app.zen_browser.zen.desktop";
  #     "x-scheme-handler/about" = "app.zen_browser.zen.desktop";
  #     "x-scheme-handler/unknown" = "app.zen_browser.zen.desktop";
  #   };
  # };
}
