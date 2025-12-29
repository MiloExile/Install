#!/bin/bash
# ----------------------------
# PulseAudio loopback toggle
# ----------------------------

# Command to run
PROC="pw-loopback --capture=alsa_input.usb-PreSonus_AudioBox_Go_UGBA21484258-00.analog-stereo \
--playback=alsa_output.usb-Corsair_CORSAIR_HS80_MAX_WIRELESS_Gaming_Receiver_13FD4D7B74A86463-00.analog-stereo \
--latency=0"

# Check if process is already running
if pgrep -f "$PROC" >/dev/null; then
    echo "Stopping existing loopback..."
    pkill -f "$PROC"
else
    echo "Starting loopback..."
    nohup $PROC >/dev/null 2>&1 &
    sleep 0.1  # brief wait to let pgrep detect the new process
fi
