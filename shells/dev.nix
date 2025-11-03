{inputs, ...}: let
  pkgs = inputs.nixpkgs.legacyPackages."x86_64-linux";
in
  pkgs.mkShell {
    packages = [
      pkgs.nodejs
    ];
  }
