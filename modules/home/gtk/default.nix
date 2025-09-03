{
  lib,
  config,
  pkgs,
  ...
}: {
  # Setup extensions
  home.packages = with pkgs; [
    gnomeExtensions.dash-to-dock
    gnomeExtensions.blur-my-shell
    gnomeExtensions.appindicator
    gnomeExtensions.bluetooth-battery-meter
    gnomeExtensions.gsconnect
  ];

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
