use blake3;
use std::time::Instant;
use std::process::Command;
use std::fs;

fn main() {
    let challenge = "whammy_flex";
    let mut nonce = 0u64;
    let start = Instant::now();

    loop {
        let input = format!("{}{}", challenge, nonce);
        let hash = blake3::hash(input.as_bytes());
        let hex = hash.to_hex();

        if hex.starts_with("00000") {
            println!("✅ Valid share! Nonce: {}, Hash: {}", nonce, hex);
            fs::write("metrics.txt", format!("wfx_valid_shares_total 1\n")).unwrap();

            let _ = Command::new("bash").arg("mint.sh").output();
            nonce = 0;
        } else if nonce % 100000 == 0 {
            println!("[...] Attempts: {}", nonce);
        }

        nonce += 1;
    }
}
