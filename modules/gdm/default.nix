{
  config,
  pkgs,
  lib,
  ...
}: {
  services.xserver.displayManager.gdm.enable = lib.mkForce true;

  programs.dconf.profiles.gdm = {
    databases = [
      {
        lockAll = true;
        settings = {
          "org/gnome/desktop/interface" = {
            accent-color = "slate";
            color-scheme = "prefer-dark";
          };
        };
      }
    ];
  };
}
