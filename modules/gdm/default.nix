{
  config,
  pkgs,
  lib,
  ...
}: {
  services.xserver.displayManager.gdm.enable = lib.mkForce true;
}
