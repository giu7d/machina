CURRENT_DIR=$(pwd)

echo "🔧 Pushing changes..."

cd "$NH_FLAKE" || return 1

git push origin main

cd "$CURRENT_DIR" || return 1

echo "✅ Changes pushed!"