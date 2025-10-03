CURRENT_DIR=$(pwd)



echo "🔧 Updating the system…"

cd "$FLAKE_HOME" || return 1

nix flake update --flake "$FLAKE_HOME" || return 1

git add flake.lock

git commit -m "chore: update nix flake" || echo "Nothing to commit"

sudo nixos-rebuild switch --flake "$FLAKE_HOME#$FLAKE_HOST"

cd "$CURRENT_DIR" || return 1

echo "✅ System updated!"