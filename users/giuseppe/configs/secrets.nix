{inputs, ...}: {
  sops = {
    age.keyFile = "/home/giuseppe/.config/sops/age/key.txt";

    defaultSopsFile = ../../../secrets.yaml;
    validateSopsFiles = false;

    # secrets will be output to /run/secrets
    secrets = {
      "private_keys/giuseppe" = {
        path = "/home/giuseppe/.ssh/id_giu";
      };
    };
  };
}
