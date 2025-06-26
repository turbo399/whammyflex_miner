#!/bin/bash

PORT=8001
echo "🛑 Stopping metrics exporter on port $PORT..."

# Kill process using port 8001
PID=$(lsof -ti :$PORT)
if [ -n "$PID" ]; then
  kill "$PID"
  echo "✅ Exporter stopped (PID $PID)."
else
  echo "⚠️  No exporter running on port $PORT."
fi

# Try to kill miner if running (based on 'run_miner.sh')
echo "🔍 Looking for miner process..."
MINER_PID=$(pgrep -f run_miner.sh)
if [ -n "$MINER_PID" ]; then
  kill "$MINER_PID"
  echo "✅ Miner stopped (PID $MINER_PID)."
else
  echo "⚠️  Miner not running or already stopped."
fi

echo "✔️  All relevant processes stopped."

sudo pkill -f whammyflex-miner
