#!/bin/bash
# Bump the library cache-bust version and sync the showcase links.
#
# Run this whenever tokens.css or components.css changes. Query-param versioning
# forces browsers to re-fetch the CSS instead of using a stale cached copy.
#
# Usage:
#   ./publish.sh              — bumps VERSION + updates showcase links, then prints commit/push steps
#   ./publish.sh --push MSG   — bumps, commits with MSG, and pushes to origin/main in one shot

set -e
cd "$(dirname "$0")"

CURRENT=$(cat VERSION 2>/dev/null || echo "1")
NEXT=$((CURRENT + 1))

# Bump VERSION
echo "$NEXT" > VERSION

# Update showcase's ?v=N links and topbar version chip
sed -i.bak \
  -e "s|tokens.css?v=[0-9]*|tokens.css?v=$NEXT|g" \
  -e "s|components.css?v=[0-9]*|components.css?v=$NEXT|g" \
  -e "s|<span class=\"sc-topbar-chip\">v[0-9.]*</span>|<span class=\"sc-topbar-chip\">v$NEXT</span>|" \
  index.html
rm -f index.html.bak

# Update the version header inside each CSS file (used for on-disk sanity checks)
for f in components.css tokens.css; do
  if head -1 "$f" | grep -q "^/\* v[0-9]* "; then
    sed -i.bak "1s|^/\* v[0-9]* |/* v$NEXT |" "$f"
    rm -f "$f.bak"
  fi
done

echo "✓ Bumped v$CURRENT → v$NEXT"
echo "  - VERSION updated"
echo "  - index.html links now use ?v=$NEXT"
echo "  - CSS header comments updated"
echo ""

if [ "$1" = "--push" ] && [ -n "$2" ]; then
  git add -A
  git commit -m "$2

v$NEXT · library cache-bust"
  git push origin main
  echo ""
  echo "✓ Committed and pushed."
else
  echo "Next steps:"
  echo "  git status && git diff"
  echo "  git add -A && git commit -m \"...\""
  echo "  git push origin main"
fi
