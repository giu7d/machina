{
  config,
  pkgs,
  lib,
  ...
}: {
  # imports = [
  #   ./theme.nix
  #   ./extensions.nix
  # ];

  services.xserver.desktopManager.gnome.enable = lib.mkForce true;
}
