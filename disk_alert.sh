#!/bin/bash

# Set threshold value
THRESHOLD=80

# Get current disk usage on /
USAGE=$(df / | tail -1 | awk '{print $5}' | sed 's/%//')

# Check if usage exceeds threshold
if [ "$USAGE" -gt "$THRESHOLD" ]; then
    WARNING="Disk space on / is above threshold! Usage: ${USAGE}%"
    echo "$WARNING"

    # Log the warning to a system log file
    logger "$WARNING"

    # Optional: Send email alert (configure mail system beforehand)
    # Replace 'you@example.com' with your desired email
    echo "$WARNING" | mail -s "Disk Alert: / usage high" jenishbabu@1406@gmail.com
fi

