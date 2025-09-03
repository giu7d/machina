{
  lib,
  config,
  pkgs,
  ...
}: {
  # Setup extensions
  home.packages = with pkgs.gnomeExtensions; [
    dash-to-dock
    blur-my-shell
    appindicator
    bluetooth-battery-meter
    gsconnect
  ];

  dconf.settings = {
    "org/gnome/shell" = {
      enabled-extensions = [
        "appindicatorsupport@rgcjonas.gmail.com"
        "Bluetooth-Battery-Meter@maniacx.github.com"
        "blur-my-shell@aunetx"
        "dash-to-dock@micxgx.gmail.com"
        "gsconnect@andyholmes.github.io"
      ];

      # Setup dash-to-dock
      "org/gnome/shell/extensions/dash-to-dock" = {
        apply-custom-theme = true;
        background-opacity = 0.5;
        custom-background-color = false;
        custom-theme-shrink = true;
        dash-max-icon-size = 32;
        disable-overview-on-startup = true;
        dock-position = "'BOTTOM'";
        height-fraction = 0.9;
        hide-tooltips = false;
        intellihide-mode = "'FOCUS_APPLICATION_WINDOWS'";
        isolate-workspaces = false;
        multi-monitor = true;
        preferred-monitor = -2;
        preferred-monitor-by-connector = "'DP-3'";
        preview-size-scale = 0.0;
        show-favorites = true;
        show-trash = true;
        show-windows-preview = true;
        transparency-mode = "'FIXED'";
      };
    };
  };

  # Setup themes
  gtk = {
    enable = true;
    iconTheme = {
      name = "WhiteSur";
      package = pkgs.whitesur-icon-theme.override {
        boldPanelIcons = true;
        alternativeIcons = true;
      };
    };
  };
}
