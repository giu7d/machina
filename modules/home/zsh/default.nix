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
      # Asdf completion and initialization
      (lib.mkOrder 1000 ''
        . "${pkgs.asdf-vm}/share/asdf-vm/asdf.sh"
        fpath=("${pkgs.asdf-vm}/share/asdf-vm/completions" $fpath)
      '')
      # Start zsh completion system
      (lib.mkOrder 1100 ''
        autoload -Uz compinit
        compinit
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
      nix-upgrade = ''
        nix flake update --flake "$FLAKE_HOME" || return 1
        cd "$FLAKE_HOME" || return 1
        git add flake.lock
        git commit -m "chore: update nix flake" || echo "Nothing to commit"
        sudo nixos-rebuild switch --flake "$FLAKE_HOME#$FLAKE_HOST"
      '';
      nix-rebuild = "sudo nixos-rebuild switch --flake $FLAKE_HOME#$FLAKE_HOST";
      nix-rebuild-boot = "sudo nixos-rebuild boot --flake $FLAKE_HOME#$FLAKE_HOST";
    };
  };

  home.file.".zshenv".text = ''
    export ZDOTDIR="$HOME/.config/zsh"
  '';
}
