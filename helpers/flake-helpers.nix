inputs: let
  mkHomeManagerConfig = extraImports: {
    home-manager.useGlobalPkgs = false;
    home-manager.useUserPackages = true;
    home-manager.backupFileExtension = "bak";
    home-manager.extraSpecialArgs = {inherit inputs;};
    home-manager.sharedModules = [
      inputs.sops.homeManagerModules.sops
    ];
    home-manager.users.giuseppe.imports =
      [
        ../users/giuseppe/configs/home.nix
        ../users/giuseppe/configs/gitconfig.nix
        ../users/giuseppe/configs/secrets.nix
      ]
      ++ extraImports;
  };
in {
  mkNixos = machineHostname: nixpkgsVersion: extraModules: extraHomeModules: {
    nixosConfigurations.${machineHostname} = nixpkgsVersion.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = {
        inherit inputs;
      };
      modules =
        [
          # External Modules
          inputs.disko.nixosModules.disko
          inputs.sops.nixosModules.sops
          inputs.home-manager.nixosModules.home-manager
          inputs.nix-flatpak.nixosModules.nix-flatpak
          # Base Modules
          ../hosts/__default__
          ../hosts/${machineHostname}
          ../users/giuseppe
          # User Modules
          (mkHomeManagerConfig extraHomeModules)
        ]
        ++ extraModules;
    };
    devShells."x86_64-linux".default = import ../shells/dev.nix inputs.nixpkgs.legacyPackages."x86_64-linux";
  };
  mkMerge = inputs.nixpkgs.lib.lists.foldl' (
    a: b: inputs.nixpkgs.lib.attrsets.recursiveUpdate a b
  ) {};
}
