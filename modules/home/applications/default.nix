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
    transmission_4-gtk
    # Development
    vscode
    gh
    # Security
    yubioath-flutter
    protonvpn-gui
    # Personal
    gnome-tweaks
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
    "io.anytype.anytype" # Anytype
    # Image & Media
    "com.github.huluti.Coulr" # Coulr
    "io.gitlab.adhami3310.Converter" # Converter
    "page.kramo.Sly" # Sly
    "dev.geopjr.Calligraphy" # Calligraphy
    "tv.plex.PlexDesktop" # Plex
    "org.gnome.Decibels" # Decibels
    "com.tomjwatson.Emote" # Emote
    # Development
    "rest.insomnia.Insomnia" # Insomnia
    "io.beekeeperstudio.Studio" # Beekeeper Studio
    # Chat
    "com.discordapp.Discord" # Discord
    # Games
    "com.usebottles.bottles" # Bottles
  ];
}
