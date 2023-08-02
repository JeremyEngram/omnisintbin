#!/bin/bash

# Specify the log file you want to suppress
LOG_FILE="/var/log/syslog"

# Specify the maximum number of occurrences before suppressing the log
MAX_OCCURRENCES=3

# Create a new rsyslog configuration file
RSYSLOG_CONF="/etc/rsyslog.d/suppress_recurring_logs.conf"

# Check if the log file exists
if [ ! -f "$LOG_FILE" ]; then
    echo "Log file '$LOG_FILE' does not exist."
    exit 1
fi

# Check if the rsyslog configuration file already exists
if [ -f "$RSYSLOG_CONF" ]; then
    echo "rsyslog configuration file '$RSYSLOG_CONF' already exists."
    exit 1
fi

# Create the rsyslog configuration file
echo "\$RepeatedMsgReduction on" | sudo tee "$RSYSLOG_CONF" >/dev/null
echo "\$RepeatedMsgReductionInterval $MAX_OCCURRENCES" | sudo tee -a "$RSYSLOG_CONF" >/dev/null
echo "\$RepeatedMsgReductionSuspensionInterval 0" | sudo tee -a "$RSYSLOG_CONF" >/dev/null
echo ":msg, !contains, \"^\[last message repeated\" ~" | sudo tee -a "$RSYSLOG_CONF" >/dev/null

# Restart the rsyslog service to apply the changes
sudo service rsyslog restart

echo "Recurring log suppression configured successfully for '$LOG_FILE'."
