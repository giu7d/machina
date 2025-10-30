inputs: let
  mkHomeManagerConfig = extraImports: {
    home-manager.useGlobalPkgs = false;
    home-manager.useUserPackages = true;
    home-manager.backupFileExtension = "bak";
    home-manager.extraSpecialArgs = {inherit inputs;};
    home-manager.users.giuseppe.imports =
      [
        ../users/giuseppe/configs/home.nix
        ../users/giuseppe/configs/gitconfig.nix
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
          inputs.sops.nixosModules.sops
          # Base Modules
          ../hosts/__default__
          ../hosts/${machineHostname}
          ../users/giuseppe
          # User Modules
          (mkHomeManagerConfig extraHomeModules)
        ]
        ++ extraModules;
    };
  };
  mkMerge = inputs.nixpkgs.lib.lists.foldl' (
    a: b: inputs.nixpkgs.lib.attrsets.recursiveUpdate a b
  ) {};
}
