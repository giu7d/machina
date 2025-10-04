{
  config,
  pkgs,
  ...
}: let
in {
  nix.settings.trusted-users = ["root" "giuseppe"];

  users.users.giuseppe = {
    isNormalUser = true;
    description = "Giuseppe";
    shell = pkgs.zsh;
    extraGroups = [
      "networkmanager"
      "wheel"
      "docker"
    ];
  };

  programs.zsh.enable = true;
}
