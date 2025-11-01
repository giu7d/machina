{inputs, ...}: let
  secretsPath = builtins.toString inputs.machina-secrets;
in {
  sops = {
    age.keyFile = "/home/giuseppe/.config/sops/age/keys.txt";

    defaultSopsFile = "${secretsPath}/secrets.yaml";
    validateSopsFiles = false;

    secrets = {
      "private_keys/giuseppe" = {
        path = "/home/giuseppe/.ssh/id_giuseppe";
      };
      "public_keys/giuseppe" = {
        path = "/home/giuseppe/.ssh/id_giuseppe.pub";
      };
    };
  };
}
