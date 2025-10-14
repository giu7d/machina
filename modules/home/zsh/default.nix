{
  lib,
  config,
  pkgs,
  ...
}: let
  typewrittenTheme = pkgs.fetchFromGitHub {
    owner = "reobin";
    repo = "typewritten";
    rev = "v1.5.2";
    sha256 = "09y419rcylm5l6qy8pjj90zk4lx8b1vanbkdi7wcl03wngndwwv4";
  };
in {
  programs.zsh = {
    # Main ZDOTDIR config directory
    dotDir = ".config/zsh";

    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    history.size = 10000;

    oh-my-zsh = {
      enable = true;
      theme = "typewritten";
      custom = "${typewrittenTheme}";
      plugins = [
        "gh"
        "git"
        "npm"
        "sdk"
      ];
    };

    initContent = lib.mkMerge [
      # Configure typewritten theme
      (lib.mkOrder 500 ''
        export TYPEWRITTEN_SYMBOL="->"
        export TYPEWRITTEN_CURSOR="underscore"
        export TYPEWRITTEN_PROMPT_LAYOUT="singleline"
      '')
    ];

    shellAliases = {
      # Basic aliases
      c = "clear";
      x = "exit";
      cp = "cp -rv";
      rm = "rm -rIv";
      mv = "mv -v";
      mkdir = "mkdir -p";

      # Vim aliases
      vim = "nvim";
      edit = "nvim";

      # Nix aliases
      nix-check = "nix flake check $FLAKE_HOME";
      nix-upgrade = "${./scripts/nix-upgrade.sh}";
      nix-push = "${./scripts/nix-push.sh}";
      nix-rebuild = "sudo nixos-rebuild switch --flake $FLAKE_HOME#$FLAKE_HOST";
      nix-rebuild-boot = "sudo nixos-rebuild boot --flake $FLAKE_HOME#$FLAKE_HOST";
    };
  };

  home.file.".zshenv".text = ''
    export ZDOTDIR="$HOME/.config/zsh"
  '';
}
