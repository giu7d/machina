{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-25.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable?shallow=true";

    impermanence.url = "github:nix-community/impermanence";

    disko = {
      url = "github:nix-community/disko/latest";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Manage Secrets
    # TODO: undestand how to use secrets.
    # agenix = {
    #   url = "github:ryantm/agenix?shallow=true";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
    # home-manager = {
    #   url = "github:nix-community/home-manager/release-25.05?shallow=true";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
    # home-manager-unstable = {
    #   url = "github:nix-community/home-manager/master?shallow=true";
    #   inputs.nixpkgs.follows = "nixpkgs-unstable";
    # };
  };

  outputs = {nixpkgs, ...} @ inputs: let
    helpers = import ./helpers/flake-helpers.nix inputs;
    inherit (helpers) mkMerge mkNixos;
  in
    mkMerge [
      (mkNixos "hana" inputs.nixpkgs [
        ])
    ];
}
