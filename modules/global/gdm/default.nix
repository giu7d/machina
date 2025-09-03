{
  config,
  pkgs,
  lib,
  ...
}: let
  monitorsXmlContent = builtins.readFile ./files/monitors.xml;
  monitorsConfig = pkgs.writeText "gdm_monitors.xml" monitorsXmlContent;
in {
  services.xserver.displayManager.gdm.enable = lib.mkForce true;

  # Setup Theme
  programs.dconf.profiles.gdm = {
    databases = [
      {
        lockAll = true;
        settings = {
          "org/gnome/desktop/interface" = {
            accent-color = "slate";
            color-scheme = "prefer-dark";
          };

          "org/gnome/login-screen" = {
            logo = "";
          };
        };
      }
    ];
  };

  # Setup GDM Monitors Configuration
  systemd.tmpfiles.rules = [
    "L+ /run/gdm/.config/monitors.xml - - - - ${monitorsConfig}"
  ];
}
