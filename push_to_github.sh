#!/usr/bin/env bash
set -euo pipefail

REMOTE_URL=${1:-}
BRANCH=${2:-main}

if [ -z "$REMOTE_URL" ]; then
  echo "Usage: ./push_to_github.sh <remote-url> [branch]"
  exit 1
fi

if [ ! -d .git ]; then
  git init
  echo "Initialized new git repository"
fi

if git remote get-url origin >/dev/null 2>&1; then
  git remote remove origin
fi
git remote add origin "$REMOTE_URL"

git add .
if git commit -m "Initial commit" -a >/dev/null 2>&1; then
  echo "Committed changes"
else
  echo "No changes to commit or commit failed"
fi

git branch -M "$BRANCH"
git push -u origin "$BRANCH"
