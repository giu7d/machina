{pkgs, ...}: {
  boot.kernelParams = [
    "quiet"
    "splash"
    "boot.shell_on_fail"
    "udev.log_priority=3"
    "rd.systemd.show_status=auto"
  ];

  boot.plymouth = {
    enable = true;
    theme = "hexagon_2";
    themePackages = with pkgs; [
      # By default we would install all themes
      (adi1090x-plymouth-themes.override {
        selected_themes = ["hexagon_2"];
      })
    ];
  };

  boot.consoleLogLevel = 3;
  boot.initrd.verbose = false;
  boot.loader.timeout = 0;
}
