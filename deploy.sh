#!/bin/bash

# Config
STACK_DIR="$HOME/stack"
LOG_FILE="$HOME/deploy.log"
DATE=$(date '+%Y-%m-%d %H:%M:%S')

# Helper for logging
log() {
    echo "[$DATE] $1" | tee -a "$LOG_FILE"
}

log "Checking for updates..."

# 1. Navigate to directory
cd "$STACK_DIR" || { log "❌ Error: Directory $STACK_DIR not found."; exit 1; }

# 2. Git Pull & Capture Output
GIT_OUTPUT=$(git pull)

# 3. Smart Decision: Only run Docker if code changed OR if "force" argument is used
if [[ "$GIT_OUTPUT" == *"Already up to date."* ]] && [ "$1" != "force" ]; then
    log "✅ No changes found. Skipping Docker build."
    exit 0
else
    log "⬇️  Changes detected (or forced):"
    echo "$GIT_OUTPUT" | tee -a "$LOG_FILE"
    
    log "🔄 Updating Git Submodules (Themes)..."
    # CRITICAL: This ensures themes are actually downloaded
    git submodule update --init --recursive >> "$LOG_FILE" 2>&1

    log "🐳 Rebuilding and refreshing containers..."
    
    # 4. Docker Compose 'Smart Update'
    # --build: Ensures Hugo recompiles the site
    # --remove-orphans: Cleans up old containers
    docker compose up -d --build --remove-orphans
    
    # 5. Housekeeping (Crucial for $2 VPS with limited storage)
    docker image prune -f > /dev/null 2>&1
    
    log "🚀 Deployment successful."
fi