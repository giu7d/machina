{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./hardware
    ./file-system.nix
  ];

  #
  # Bootloader
  #
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxPackages_latest;

  #
  # Hibernation
  #
  boot.kernelParams = ["resume=/dev/disk/by-uuid/435e2500-5115-4cdd-b0cd-a6a2d25225d6"];
  boot.resumeDevice = "/dev/disk/by-uuid/435e2500-5115-4cdd-b0cd-a6a2d25225d6";
  powerManagement.enable = true;
  # Prevent black screen on resume
  systemd.services."systemd-suspend" = {
    serviceConfig = {
      Environment = ''"SYSTEMD_SLEEP_FREEZE_USER_SESSIONS=false"'';
    };
  };

  #
  # Network
  #
  networking.hostName = "hana";
  networking.networkmanager.enable = true;
  networking.firewall.enable = true;
  networking.firewall.allowedTCPPortRanges = [
    # KDE Connect
    {
      from = 1714;
      to = 1764;
    }
  ];
  networking.firewall.allowedUDPPortRanges = [
    # KDE Connect
    {
      from = 1714;
      to = 1764;
    }
  ];

  #
  # Desktop Environment
  #
  services.xserver.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;
  services.xserver.xkb = {
    layout = "us";
    variant = "intl";
  };

  #
  # Audio
  #
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # To use JACK applications:
    #jack.enable = true;
  };

  #
  # Other Services
  #
  console.keyMap = "us-acentos";
  services.printing.enable = true;
  services.pcscd.enable = true; # Smart card reader service

  #
  # Packages
  #
  services.flatpak.enable = true;
  systemd.services.flatpak-repo = {
    wantedBy = ["multi-user.target"];
    path = [pkgs.flatpak];
    script = ''
      flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
    '';
  };

  programs.appimage = {
    enable = true;
    binfmt = true;
  };

  environment.systemPackages = with pkgs; [
    appimage-run
    iptables
    # Keyboard
    qmk
    qmk-udev-rules
    via
    vial
  ];

  #
  # Keyboard Firmware
  #
  services.udev.packages = with pkgs; [
    # Keyboard
    qmk-udev-rules
    qmk
    via
    vial
  ];

  #
  # Environment Variables
  #
  environment.sessionVariables = {
    FLAKE_HOME = "$HOME/Workspaces/machina";
    FLAKE_HOST = "hana";
  };
}
