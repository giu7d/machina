inputs: let
in {
  mkNixos = machineHostname: nixpkgsVersion: extraModules: {
    nixosConfigurations.${machineHostname} = nixpkgsVersion.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = {
        inherit inputs;
      };
      modules =
        [
          ../hosts/__default__
          ../hosts/${machineHostname}
          ../users/giuseppe
        ]
        ++ extraModules;
    };
  };
  mkMerge = inputs.nixpkgs.lib.lists.foldl' (
    a: b: inputs.nixpkgs.lib.attrsets.recursiveUpdate a b
  ) {};
}
