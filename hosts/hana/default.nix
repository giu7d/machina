{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./hardware/default.nix
    ./hardware/disk.nix
    ./hardware/gpu.nix
    ./boot.nix
  ];

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

  #
  # Packages
  #
  programs.firefox.enable = true;
  environment.systemPackages = with pkgs; [
    alejandra
    vscode
    gh
  ];
}
