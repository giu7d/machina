CURRENT_DIR=$(pwd)

echo "🔧 Pushing changes..."

cd "$FLAKE_HOME" || return 1

git push origin main

cd "$CURRENT_DIR" || return 1

echo "✅ Changes pushed!"