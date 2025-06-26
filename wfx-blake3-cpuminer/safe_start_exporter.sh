#!/bin/bash

PORT=8001
EXPORTER_LOG="logs/metrics_exporter.log"

if lsof -i :$PORT &>/dev/null; then
  echo "🟢 Exporter already running on port $PORT. No action taken."
else
  echo "🚀 Exporter not running — starting now..."
  ./start_all.sh &> "$EXPORTER_LOG" &
  echo "✅ Exporter and miner started. Logs at $EXPORTER_LOG"
fi
