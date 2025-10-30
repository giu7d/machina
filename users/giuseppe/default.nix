{
  config,
  pkgs,
  ...
}: let
in {
  sops.secrets.giuseppe-password.neededForUsers = true;

  nix.settings.trusted-users = ["root" "giuseppe"];

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
  };

  programs.zsh.enable = true;
}
