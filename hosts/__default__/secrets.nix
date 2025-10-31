{inputs, ...}: {
  sops = {
    defaultSopsFile = ../../secrets.yaml;
    validateSopsFiles = false;

    age = {
      # automatically import host ssh keys as age keys
      sshKeyPaths = ["/etc/ssh/ssh_host_ed25519_key"];
    };

    # secrets will be output to /run/secrets
    secrets = {
      "public_keys/sora" = {};
    };
  };
}
