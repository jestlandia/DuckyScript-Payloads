#!/bin/bash

# ====== CONFIGURE THIS ======
SCRIPT_PATH="$HOME/.cache/annoying_mac.sh"   # Filepath to script
LABEL="com.$USER.toggle"                     # Unique identifier
HOUR=1
MINUTE=33
# =============================

PLIST_DIR="$HOME/Library/LaunchAgents"
PLIST_PATH="$PLIST_DIR/$LABEL.plist"

# Ensure script exists
if [ ! -f "$SCRIPT_PATH" ]; then
  echo "❌ Script not found: $SCRIPT_PATH"
  exit 1
fi

# Make script executable
chmod +x "$SCRIPT_PATH"

# Create LaunchAgents folder (if needed)
mkdir -p "$PLIST_DIR"

# Write .plist file
cat > "$PLIST_PATH" <<EOF
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN"
   "http://www.apple.com/DTDs/PropertyList-1.0.dtd">

<plist version="1.0">
<dict>
    <key>Label</key>
    <string>$LABEL</string>

    <key>ProgramArguments</key>
    <array>
        <string>$SCRIPT_PATH</string>
    </array>

    <key>StartCalendarInterval</key>
    <dict>
        <key>Hour</key>
        <integer>$HOUR</integer>
        <key>Minute</key>
        <integer>$MINUTE</integer>
    </dict>

    <key>StandardOutPath</key>
    <string>/tmp/toggle.out</string>

    <key>StandardErrorPath</key>
    <string>/tmp/toggle.err</string>

    <key>RunAtLoad</key>
    <true/>
</dict>
</plist>
EOF

# Unload old version (if loaded)
launchctl unload "$PLIST_PATH" 2>/dev/null

# Load new job
launchctl load "$PLIST_PATH"
