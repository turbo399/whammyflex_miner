from prometheus_client import start_http_server, Gauge
import time
import random
import re

# Define Prometheus metrics
valid_shares = Gauge("wfx_valid_shares", "Valid shares found")
hash_attempts = Gauge("wfx_hash_attempts", "Hash attempts")
miner_up = Gauge("wfx_miner_up", "Miner running status (1=up, 0=down)")
total_minted = Gauge("wfx_total_minted", "Total WFX coins minted")

# Path to your mock miner log
LOG_PATH = "/home/turbo/whammyflex-miner/logs/miner.log"

# Keep track of fake total minted value
fake_total = 0.0

def update_metrics():
    global fake_total
    try:
        with open(LOG_PATH, "r") as f:
            lines = f.readlines()[-20:]

        attempts = 0
        shares = 0
        running = 0

        for line in lines:
            if "Attempts:" in line:
                match = re.search(r"Attempts:\s*(\d+)", line)
                if match:
                    attempts += int(match.group(1))

            if "Valid share!" in line:
                shares += 1
                running = 1

        valid_shares.set(shares)
        hash_attempts.set(attempts)
        miner_up.set(running)

        # Simulate WFX minting only if miner is up
        if running:
            fake_total += random.randint(1, 3)
        total_minted.set(fake_total)

    except Exception as e:
        miner_up.set(0)
        print("Error reading miner log:", e)

if __name__ == "__main__":
    start_http_server(8001)
    print("Metrics exporter running on port 8001")

    while True:
        update_metrics()
        time.sleep(10)
