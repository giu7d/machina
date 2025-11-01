{
  config,
  pkgs,
  inputs,
  ...
}: let
  secretsPath = builtins.toString inputs.machina-secrets;
in {
  sops.secrets.giuseppe-password.neededForUsers = true;

  nix.settings.trusted-users = ["root" "giuseppe"];

  # users.mutableUsers = false;

  users.users.giuseppe = {
    isNormalUser = true;
    description = "Giuseppe";
    hashedPasswordFile = config.sops.secrets.giuseppe-password.path;
    shell = pkgs.zsh;
    extraGroups = [
      "networkmanager"
      "wheel"
      "docker"
    ];

    openssh.authorizedKeys.keys = [
      (builtins.readFile "${secretsPath}/public_keys/id_sora.pub")
    ];
  };

  programs.zsh.enable = true;
}
