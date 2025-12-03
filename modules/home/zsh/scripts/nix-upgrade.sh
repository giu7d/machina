CURRENT_DIR=$(pwd)

echo "🔧 Updating the system…"

cd "$NH_FLAKE" || return 1

nix flake update --flake "$NH_FLAKE" || return 1

git add flake.lock

git commit -m "chore: update nix flake" > /dev/null || echo "Nothing to commit"

nh os switch --update

cd "$CURRENT_DIR" || return 1

echo "✅ System updated!"