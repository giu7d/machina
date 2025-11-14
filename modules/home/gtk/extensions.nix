{
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
    user-themes
  ];

  dconf.settings = {
    #
    # Enable extensions
    #
    "org/gnome/shell" = {
      allow-extension-installation = true;
      disable-user-extensions = false;
      enabled-extensions = [
        "appindicatorsupport@rgcjonas.gmail.com"
        "Bluetooth-Battery-Meter@maniacx.github.com"
        "blur-my-shell@aunetx"
        "dash-to-dock@micxgx.gmail.com"
        "gsconnect@andyholmes.github.io"
        "user-theme@gnome-shell-extensions.gcampax.github.com"
      ];
    };

    #
    # Setup extension dash-to-dock
    #
    "org/gnome/shell/extensions/dash-to-dock" = {
      apply-custom-theme = false;
      background-color = "rgb(154,153,150)";
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
      show-apps-at-top = true;
      show-favorites = true;
      show-trash = true;
      show-windows-preview = true;
      transparency-mode = "DYNAMIC";
    };

    #
    # Setup extension blur-my-shell
    #
    "org/gnome/shell/extensions/blur-my-shell/dash-to-dock" = {
      blur = true;
      brightness = 1.0;
      override-background = false;
      sigma = 50;
      static-blur = false;
      unblur-in-overview = true;
    };

    "org/gnome/shell/extensions/blur-my-shell/panel" = {
      brightness = 0.8;
      force-light-text = false;
      override-background = true;
      sigma = 20;
      static-blur = false;
    };

    "org/gnome/shell/extensions/blur-my-shell/applications" = {
      blur = true;
      blur-on-overview = false;
      brightness = 1.0;
      dynamic-opacity = false;
      opacity = 255;
      sigma = 50;
      whitelist = ["kitty"];
    };
  };

  # Enable GSConnect (KDE Connect for GNOME)
  services.kdeconnect = {
    enable = true;
    package = pkgs.gnomeExtensions.gsconnect;
  };
}
