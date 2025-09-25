{
  lib,
  config,
  pkgs,
  inputs,
  ...
}: {
  # Enable nix-flatpak support inside home-manager
  # https://github.com/gmodena/nix-flatpak?tab=readme-ov-file#notes-on-homemanager
  imports = [inputs.nix-flatpak.homeManagerModules.nix-flatpak];

  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.allowUnfreePredicate = true;

  #
  # Setup User Packages
  #
  home.packages = with pkgs; [
    alejandra
    dconf-editor
    btop
    # Development
    vscode
    gh
    devbox
    # Security
    yubioath-flutter
    protonvpn-gui
    # Personal
    gnome-software
    youtube-music
  ];

  #
  # Setup Flatpak
  #
  services.flatpak.packages = [
    # Security
    "com.bitwarden.desktop" # Bitwarden
    # Browsers
    "app.zen_browser.zen" # Zen Browser
    "com.brave.Browser" # Brave Browser
    # Notes
    "md.obsidian.Obsidian" # Obsidian
    # Image & Media
    "com.github.huluti.Coulr" # Coulr
    "io.gitlab.adhami3310.Converter" # Converter
    "page.kramo.Sly" # Sly
    "dev.geopjr.Calligraphy" # Calligraphy
    "tv.plex.PlexDesktop" # Plex
    "org.gnome.Decibels" # Decibels
    # Development
    "rest.insomnia.Insomnia" # Insomnia
    "io.beekeeperstudio.Studio" # Beekeeper Studio
    # Chat
    "com.discordapp.Discord" # Discord
    # Games
    "com.usebottles.bottles" # Bottles
  ];
}
