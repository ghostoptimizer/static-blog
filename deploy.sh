#!/usr/bin/env bash
set -euo pipefail

# ───── CONFIG ─────
REMOTE_USER=webdeploy
REMOTE_HOST=138.197.89.112
REMOTE_BASE=/var/www
RELEASES_DIR=$REMOTE_BASE/releases
CURRENT_LINK=$REMOTE_BASE/current
SSH_KEY=~/.ssh/jadonsblog_deploy
# ───────────────────

# 1) Build your Hugo site into public/
echo "Building Hugo site…"
hugo -d public

# 2) Make sure the remote releases dir exists
ssh -i $SSH_KEY $REMOTE_USER@$REMOTE_HOST \
    "mkdir -p $RELEASES_DIR"

# 3) Push the new files into a timestamped folder
TIMESTAMP=$(date -u +%Y%m%d%H%M%S)
echo "Uploading to release: $TIMESTAMP"
rsync -e "ssh -i $SSH_KEY" -avz --delete public/ \
    $REMOTE_USER@$REMOTE_HOST:$RELEASES_DIR/$TIMESTAMP

# 4) Flip the current symlink on the server
echo "Updating current → $TIMESTAMP"
ssh -i $SSH_KEY $REMOTE_USER@$REMOTE_HOST << EOF
  ln -sfn $RELEASES_DIR/$TIMESTAMP $CURRENT_LINK
  echo "Deployed $TIMESTAMP!"
EOF
