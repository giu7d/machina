{inputs, ...}: {
  sops = {
    defaultSopsFile = ../../secrets.yaml;
    validateSopsFiles = false;

    age = {
      # automatically import host ssh keys as age keys
      sshKeyPaths = ["/etc/ssh/ssh_host_ed25519_key"];
      # this will use an age key that is expected to already be in the FS
      keyFile = "/var/lib/sops-nix/keys.txt";
      # generate a new key if the specified does not exists
      generateKey = true;
    };

    # secrets will be output to /run/secrets
    secrets = {
      "public_keys/sora" = {};
    };
  };
}
