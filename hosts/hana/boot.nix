{pkgs, ...}: {
  #
  # Bootloader
  #
  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
    timeout = 0;
  };

  #
  # Kernel
  #
  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.kernelParams = [
    "quiet"
    "splash"
    "boot.shell_on_fail"
    "udev.log_priority=3"
    "rd.systemd.show_status=auto"
  ];

  #
  # Plymouth
  #
  boot.plymouth = {
    enable = true;
    theme = "rings";
    themePackages = with pkgs; [
      # By default we would install all themes
      (adi1090x-plymouth-themes.override {
        selected_themes = ["rings"];
      })
    ];
  };

  # Silent boot
  boot.consoleLogLevel = 3;
  boot.initrd.verbose = false;
}
