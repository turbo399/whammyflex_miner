#!/bin/bash

set -e

echo "🚀 Starting WhammyFlex Miner Setup..."

# === Step 1: Install required Rust tools ===
echo "📦 Ensuring build tools are installed..."
sudo apt-get update && sudo apt-get install -y build-essential pkg-config libssl-dev

# === Step 2: Ensure proper Cargo.toml setup ===
echo "📝 Verifying Cargo.toml dependencies..."
if ! grep -q '\[dependencies\]' Cargo.toml; then
    echo '[dependencies]' >> Cargo.toml
fi

# Add required crates if not present
grep -q 'sha2' Cargo.toml || echo 'sha2 = "0.10"' >> Cargo.toml
grep -q 'hex' Cargo.toml || echo 'hex = "0.4"' >> Cargo.toml

# === Step 3: Place Rust file correctly ===
mkdir -p src
if [ -f miner.rs ]; then
    mv -f miner.rs src/main.rs
fi

# === Step 4: Build the miner ===
echo "🔧 Building miner in release mode..."
cargo build --release

# === Step 5: Check for Prometheus setup ===
if [ ! -f prometheus.yml ]; then
    echo "⚠️ No prometheus.yml found. Skipping metrics config."
else
    echo "✅ Prometheus config found: prometheus.yml"
fi

# === Step 6: Optionally run miner and metrics exporter ===
echo
read -p "⚡ Run the miner now? [y/n] " runnow
if [[ "$runnow" == "y" ]]; then
    echo "▶️ Launching miner..."
    ./target/release/whammyflex-miner
fi

echo "✅ Setup complete!"
