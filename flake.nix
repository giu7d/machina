{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-25.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable?shallow=true";
    disko = {
      url = "github:nix-community/disko/latest";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05?shallow=true";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager-unstable = {
      url = "github:nix-community/home-manager/master?shallow=true";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };
    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=v0.6.0";
    # Manage Secrets
    # TODO: undestand how to use secrets.
    # agenix = {
    #   url = "github:ryantm/agenix?shallow=true";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
  };

  outputs = {nixpkgs, ...} @ inputs: let
    helpers = import ./helpers/flake-helpers.nix inputs;
    inherit (helpers) mkMerge mkNixos;
  in
    mkMerge [
      (mkNixos "hana" inputs.nixpkgs
        # Global Modules
        [
          ./modules/global/plymouth
          ./modules/global/gdm
          ./modules/global/steam
        ]
        # Home Modules
        [
          ./modules/home/gtk
          ./modules/home/applications
          ./modules/home/kitty
          ./modules/home/fonts
          ./modules/home/zsh
          ./modules/home/fastfetch
        ])
    ];
}
