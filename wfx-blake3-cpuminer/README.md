# 🐶 wfx-blake3-cpuminer

**WhammyFlex Miner** is a fun experimental CPU miner designed to simulate mining of the fictional Whammy Flex (WFX) memecoin. This is a back-end mock miner that works with Prometheus + Grafana for stat monitoring.

---

## 🚀 Features

- 🔧 Written in Rust with BLAKE3 hashing
- 📊 Real-time stats via Prometheus metrics exporter
- 🧠 Works great on Raspberry Pi and low-power systems
- 🎛️ Grafana integration for dashboards
- 🛠️ Shell scripts for safe start/stop

---

## 📦 Getting Started

### ✅ Prerequisites

- `cargo` (Rust compiler)
- `python3`, `pip`
- `prometheus_client` library

```bash
sudo apt install cargo python3-pip
pip install prometheus_client

🛠️ Install
git clone https://github.com/turbo399/wfx-blake3-cpuminer.git
cd wfx-blake3-cpuminer
chmod +x *.sh

🧪 Run Miner + Metrics Exporter
./safe_start_exporter.sh

📊 Grafana Integration
1.Connect Prometheus as data source.
2/Add panels for:
wfx_hashrate
wfx_total_minted
wfx_valid_shares

📁 Project Structure
.
├── src/                  # Rust source
├── metrics_exporter.py  # Prometheus metrics
├── safe_start_exporter.sh
├── stop_all.sh
├── Cargo.toml
└── README.md

🧭 Roadmap
 Mock mining simulation
 Build actual CPU miner with wallet support
 Add mining pool backend
 Package for Raspberry Pi !!!!

⚖️ License
MIT — free to use, remix, fork, and flex 🌀


---

## ✅ 3. **.gitignore for Rust**

Also create a `.gitignore` file with:

```txt
/target
*.log
__pycache__/
*.pyc
.env
.DS_Store



