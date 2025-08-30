{pkgs, ...}: {
  nix.settings.trusted-users = ["root" "giuseppe"];

  users.users.giuseppe = {
    isNormalUser = true;
    description = "Giuseppe";
    extraGroups = ["networkmanager" "wheel"];
    shell = pkgs.zsh;
  };

  programs.zsh.enable = true;
}
