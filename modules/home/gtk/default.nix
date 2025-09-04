{
  lib,
  config,
  pkgs,
  ...
}: {
  #
  # Setup extensions
  #
  home.packages = with pkgs.gnomeExtensions; [
    dash-to-dock
    blur-my-shell
    appindicator
    bluetooth-battery-meter
    gsconnect
  ];

  dconf.settings = {
    #
    # Setup title bar buttons
    #
    "org/gnome/desktop/wm/preferences" = {
      button-layout = ":minimize,maximize,close";
    };

    #
    # Enable extensions
    #
    "org/gnome/shell" = {
      enabled-extensions = [
        "appindicatorsupport@rgcjonas.gmail.com"
        "Bluetooth-Battery-Meter@maniacx.github.com"
        "blur-my-shell@aunetx"
        "dash-to-dock@micxgx.gmail.com"
        "gsconnect@andyholmes.github.io"
      ];
    };

    #
    # Setup extension dash-to-dock
    #
    "org/gnome/shell/extensions/dash-to-dock" = {
      apply-custom-theme = true;
      background-opacity = 0.5;
      custom-background-color = false;
      custom-theme-shrink = true;
      dash-max-icon-size = 32;
      disable-overview-on-startup = true;
      dock-position = "BOTTOM";
      height-fraction = 0.9;
      hide-tooltips = false;
      intellihide-mode = "FOCUS_APPLICATION_WINDOWS";
      isolate-workspaces = false;
      multi-monitor = true;
      preferred-monitor = -2;
      preferred-monitor-by-connector = "DP-3";
      preview-size-scale = 0.0;
      show-favorites = true;
      show-trash = true;
      show-windows-preview = true;
      transparency-mode = "FIXED";
    };

    #
    # Setup extension blur-my-shell
    #
    "org/gnome/shell/extensions/blur-my-shell" = {
      pipelines = ''
        {'pipeline_default': {'name': <'Default'>, 'effects': <[<{'type': <'native_static_gaussian_blur'>, 'id': <'effect_000000000000'>, 'params': <{'radius': <30>, 'brightness': <0.59999999999999998>}>}>]>}, 'pipeline_81088099055859': {'name': <'Dash'>, 'effects': <[<{'type': <'native_static_gaussian_blur'>, 'id': <'effect_86704493733674'>, 'params': <{'unscaled_radius': <30>, 'brightness': <0.80000000000000004>}>}>, <{'type': <'corner'>, 'id': <'effect_79715918997755'>, 'params': <{'radius': <14>}>}>]>}}
      '';
    };
  };

  #
  # Setup themes
  #
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
