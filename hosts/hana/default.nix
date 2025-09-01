{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./hardware/base.nix
    ./hardware/gpu.nix
  ];

  #
  # Bootloader
  #
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxPackages_latest;

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
