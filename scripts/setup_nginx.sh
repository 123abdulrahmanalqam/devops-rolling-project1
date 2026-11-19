#!/bin/bash
set -e

LOG_FILE="logs/provisioning.log"

log() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') - BASH - $1" | tee -a "$LOG_FILE"
}

log "INFO - Starting Nginx installation check..."

# 1. בדיקה האם Nginx כבר מותקן במערכת
if command -v nginx &> /dev/null; then
    log "INFO - Nginx is already installed. Skipping installation."
    exit 0
fi

log "INFO - Nginx not found. Installing Nginx..."

# 2. התקנה בהתאם למערכת ההפעלה ומנהל החבילות הזמין
if [[ "$OSTYPE" == "linux-gnu"* ]] && command -v apt-get &> /dev/null; then
    sudo apt-get update && sudo apt-get install -y nginx
elif [[ "$OSTYPE" == "darwin"* ]] && command -v brew &> /dev/null; then
    brew install nginx
else
    # מצב סימולציה למחשבים ללא apt-get / brew (כדי שהסימולטור יעבוד בכל סביבה)
    log "INFO - Package manager not available in local environment. Simulating Nginx installation..."
    sleep 1
fi

log "INFO - Nginx installation completed successfully."
