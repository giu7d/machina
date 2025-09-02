{
  config,
  pkgs,
  lib,
  ...
}: {
  #
  # Base Nix Setup
  #
  system.stateVersion = "25.05";

  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.allowUnfreePredicate = true;

  nix.settings.experimental-features = ["nix-command" "flakes"];

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
  };
  nix.optimise.automatic = true;
  nix.optimise.dates = ["weekly"];

  #
  # Base BTRFS Filesystem
  #
  services.btrfs.autoScrub = {
    enable = true;
    interval = "monthly";
    fileSystems = ["/"];
  };

  #
  # Base Locale
  #
  time.timeZone = "America/Sao_Paulo";

  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "pt_BR.UTF-8";
    LC_IDENTIFICATION = "pt_BR.UTF-8";
    LC_MEASUREMENT = "pt_BR.UTF-8";
    LC_MONETARY = "pt_BR.UTF-8";
    LC_NAME = "pt_BR.UTF-8";
    LC_NUMERIC = "pt_BR.UTF-8";
    LC_PAPER = "pt_BR.UTF-8";
    LC_TELEPHONE = "pt_BR.UTF-8";
    LC_TIME = "pt_BR.UTF-8";
    LC_CTYPE = lib.mkDefault "pt_BR.UTF-8"; # Fix ç in us-intl.
  };
  #
  # Base Applications
  #
  environment.systemPackages = with pkgs; [
    wget
    lshw
    jq
    git
    neovim
    fastfetch
  ];
}
