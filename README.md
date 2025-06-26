# 🐕‍🦺 WFX Blake3 CPU Miner

Welcome to the **Whammy Flex Miner** — a fun, open-source Rust-based CPU miner using the **Blake3** hashing algorithm. Built as part of the experimental Whammy Flex memecoin project 🧪💥.

## 🔥 What It Does

- Mines fake/test `Whammy Flex (WFX)` tokens using your CPU
- Uses the **blake3** hashing algorithm (lightweight & fast)
- Tracks mining metrics (hashes, shares, attempts) using **Prometheus**
- Displays mining stats using **Grafana dashboards**
- Great for testing on:
  - Raspberry Pi 4 / ARM
  - x86 Micro PCs
  - Hobby home servers

## 📦 Contents

```
wfx-blake3-cpuminer/
├── src/                  # Rust source files (main.rs)
├── Cargo.toml            # Rust project config
├── metrics_exporter.py   # Optional Prometheus stats exporter
├── safe_start_exporter.sh
├── stop_all.sh
├── wfx_setup.sh          # One-shot setup script
```

---

## 🛠️ Setup (Linux Only)

```bash
# 1. Clone the repo
git clone https://github.com/turbo399/whammyflex-miner.git
cd whammyflex-miner/wfx-blake3-cpuminer

# 2. Install Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# 3. Build the miner
cargo build --release

# 4. Start mining
./target/release/whammyflex-miner
```

---

## 📊 Grafana Dashboard (Optional)

If you're exporting metrics:

1. Start Prometheus
2. Import `metrics_exporter.py` stats
3. Load a Grafana dashboard from the data source
4. Monitor CPU usage, shares, nonces, attempts, etc.

---

## ⚡ About the Project

This is a personal learning project by **@turbo399**, turning memes into miners.

- 🧪 Built in Rust
- 📊 Tracked with Grafana
- 🐶 Powered by Whammy Flex
- ⚠️ Not a real coin (yet)

---

## 📜 License

MIT License (or Unlicense — your call, we can change it).
