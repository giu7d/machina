{pkgs, ...}: {
  nix.settings.trusted-users = ["root" "giuseppe"];

  users.users.giuseppe = {
    isNormalUser = true;
    description = "Giuseppe";
    initialHashedPassword = "$5$tcQas/4HwgiT9FGq$/xKkBv0Ghu7t6ryY26jlL0sZRqnz3d1q8UdzUNU2Ke7";
    extraGroups = ["networkmanager" "wheel"];
    shell = pkgs.zsh;
  };

  programs.zsh.enable = true;
}
