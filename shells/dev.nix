pkgs:
pkgs.mkShell {
  packages = with pkgs; [
    # Web Dev
    nodejs_24
    nodejs_24.pkgs.pnpm

    # Game Dev
    lua
    love
  ];

  buildInputs = [pkgs.zsh];

  shellHook = ''
    export SHELL=${pkgs.zsh}/bin/zsh
    if [ -z "$ZSH_VERSION" ]; then
      exec $SHELL
    fi
  '';
}
