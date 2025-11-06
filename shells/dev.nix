pkgs:
pkgs.mkShell {
  packages = with pkgs; [
    nodejs
    lua
  ];

  buildInputs = [pkgs.zsh];

  shellHook = ''
    export SHELL=${pkgs.zsh}/bin/zsh
    if [ -z "$ZSH_VERSION" ]; then
      exec $SHELL
    fi
  '';
}
