[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)]

# WhammyFlex Miner

WhammyFlex Miner is a fun experimental CPU miner designed to simulate mining of the fictional Whammy Flex (WFX) memecoin. This is a back-end mock miner that works with Prometheus + Grafana for stat monitoring.


🚀 Features#
🔧 Written in Rust with BLAKE3 hashing
#
📊 Real-time stats via Prometheus metrics exporter
#
🧠 Works great on Raspberry Pi and low-power systems
#
🎛️ Grafana integration for dashboards
#
🛠️ Shell scripts for safe start/stop



This repository contains the WhammyFlex CPU miner project.  
➡️ **Main content and instructions** are located in the `wfx-blake3-cpuminer/` folder.  
Please navigate into that directory for full setup guides and run instructions.

## ⚙️ How It Works

- Miner (Rust) calculates BLAKE3 hashes with nonce  
- On a valid hash (e.g., starts with `00000`), logs the share  
- `metrics_exporter.py` scrapes this log and exposes Prom metrics  
- Prometheus scrapes `/metrics`, Grafana visualizes it
