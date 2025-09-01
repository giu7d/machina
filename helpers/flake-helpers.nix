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
          inputs.disko.nixosModules.disko
          # TODO: Understand impermanence
          # inputs.impermanence.nixosModules.impermanence
          # TODO: Understand secrets
          # inputs.agenix.nixosModules.default
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
