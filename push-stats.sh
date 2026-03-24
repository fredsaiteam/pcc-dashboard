#!/bin/bash
# Sync latest usage data to GitHub Pages
# Run this after significant work to update the dashboard

DASHBOARD_DIR="/home/fredsaiteam/.openclaw/workspace/pcc-dashboard"
TRACKER_FILE="/mnt/c/Users/Claude Bot/Documents/PCC/dashboard/usage_log.json"

# Copy latest stats
if [ -f "$TRACKER_FILE" ]; then
  cp "$TRACKER_FILE" "$DASHBOARD_DIR/stats.json"
else
  echo "No tracker file yet, using empty stats"
fi

cd "$DASHBOARD_DIR"
git add -A
git commit -m "stats: update $(date '+%Y-%m-%d %H:%M')" 2>/dev/null || echo "nothing to commit"
git push origin gh-pages 2>/dev/null && echo "✅ Dashboard updated" || echo "⚠️  Push failed - check token/remote"
