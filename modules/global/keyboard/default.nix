{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    qmk
    qmk-udev-rules
    via
    vial
  ];

  services.udev.packages = with pkgs; [
    qmk-udev-rules
    qmk
    via
    vial
  ];
}
