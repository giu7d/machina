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
      plugins = [
        "asdf"
        "gh"
        "git"
        "npm"
        "sdk"
      ];
      custom = "${typewrittenTheme}";
    };

    initContent = lib.mkOrder 500 ''
      export TYPEWRITTEN_SYMBOL="->"
      export TYPEWRITTEN_CURSOR="underscore"
      export TYPEWRITTEN_PROMPT_LAYOUT="singleline"
    '';
  };

  home.file.".zshenv".text = ''
    export ZDOTDIR="$HOME/.config/zsh"
  '';
}
