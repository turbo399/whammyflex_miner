# WhammyFlex Miner

This repository contains the WhammyFlex CPU miner project.  
➡️ **Main content and instructions** are located in the `wfx-blake3-cpuminer/` folder.  
Please navigate into that directory for full setup guides and run instructions.

## ⚙️ How It Works

- Miner (Rust) calculates BLAKE3 hashes with nonce  
- On a valid hash (e.g., starts with `00000`), logs the share  
- `metrics_exporter.py` scrapes this log and exposes Prom metrics  
- Prometheus scrapes `/metrics`, Grafana visualizes it
