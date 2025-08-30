{
  config,
  pkgs,
  ...
}: {
  #
  # Base Nix Setup
  #
  system.stateVersion = "25.05";

  nix.settings.experimental-features = ["nix-command" "flakes"];

  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.allowUnfreePredicate = true;

  # TODO: Validate automatic snapshot removal
  #
  # nix.gc = {
  #   automatic = true;
  #   dates = "weekly";
  #   options = "--delete-older-than 30d";
  # };
  # nix.optimise.automatic = true;
  # nix.optimise.dates = ["weekly"];

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
