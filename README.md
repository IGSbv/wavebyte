# WAVEBYTE – Real-Time Morse Code Decoder on Tang Nano 9K

WAVEBYTE is a real-time Morse code decoder implemented in Verilog for the **Tang Nano 9K FPGA**.  
It uses an **analog Schmitt trigger** front-end for clean input and outputs decoded text to a computer over **UART**.



---

## 📦 System Overview

| Stage | Function |
|------|----------|
| **Analog Front-End** | MCP6004 op-amp configured as a Schmitt trigger to eliminate switch bounce and noise. |
| **FPGA Logic (Tang Nano 9K)** | Finite State Machine (FSM) measures timings, classifies dot/dash/gaps, buffers symbols, and decodes characters. |
| **UART Output** | Sends decoded ASCII to a computer at **9600 baud** for display in any serial terminal. |

---

## ✨ Key Features

- **Real-time Morse decoding** (A–Z, 0–9)
- **Noise-immune input** via analog Schmitt trigger
- **UART communication** (9600 baud, 8-N-1)
- **Manual controls** for:
  - Space
  - Newline
  - Destructive Backspace
- **Full screen clear** via long press

---

## 🧱 Hardware Used

| Component | Purpose |
|----------|---------|
| **Tang Nano 9K (GW1NR-LV9)** | FPGA platform for Morse decoding & UART communication |
| **MCP6004 Op-Amp** | Configured as Schmitt trigger to clean noisy push-button input |
| **Push Buttons (x3)** | 1× Morse key, 2× function controls (space, newline, backspace combo) |
| **Resistors (100kΩ, 220Ω)** | Pull-up and biasing network in analog input stage |
| **Capacitor (100nF)** | Debounce / RC filter to stabilize input transitions |
| **Breadboard & Jumper Wires** | Signal wiring and prototype assembly |


---

## 🛠️ Software / Tools

- **Gowin IDE** (Synthesis & Programming)
- **Serial Terminal** (PuTTY / screen / Arduino Serial Monitor)
- **Baud Rate:** 9600

---

## 🧩 System Architecture (Module Breakdown)

| Module | Description |
|--------|-------------|
| `top.v` | Top-level integration, system tick generation, button debouncing, UART routing, backspace & clear logic. |
| `morse_logic.v` | Timing-based FSM classifying dot, dash, letter gap, word gap, and long-press clear trigger. |
| `morse_buffer.v` | Shift register collecting per-letter dot/dash sequences. |
| `morse_decoder.v` | Combinational lookup table converting dot/dash patterns to ASCII. |
| `output_controller.v` | Prioritizes characters, spaces, newline, screen clear, destructive backspace. |
| `uart_tx.v` | UART transmitter (8-N-1 @ 9600 baud). |
| `debouncer.v` | Counter-based debouncer for function keys. |

---

## 🎮 User Interface

### Morse Key (Main Button)
| Action | Meaning | Duration |
|-------|---------|----------|
| Short Press | Dot (`.`) | ~50–200 ms |
| Long Press | Dash (`-`) | > 200 ms |
| Pause | Send Letter | ~400 ms |
| Longer Pause | Space Between Words | ~700 ms |
| Extra Long Pause | Newline | ~1200 ms |
| **Hold** | Clear Screen (ANSI `ESC[2J` + `ESC[H]`) | ≥ 2 seconds |

### Function Buttons
| Buttons | Action |
|--------|--------|
| Button 3 | Insert Space |
| Button 4 | Insert Newline |
| Hold Button 3 + Tap Button 4 | **Destructive Backspace** (Sends: `BS`, `Space`, `BS`) |

---

## 📡 UART Output Format

- **Baud:** 9600  
- **Data Bits:** 8  
- **Parity:** None  
- **Stop Bits:** 1  

Works with:
- PuTTY
- Arduino Serial Monitor
- macOS/Linux `screen`

---

## ✅ Status & Limitations

| Aspect | Status |
|--------|--------|
| Letters A–Z | Working |
| Numbers 0–9 | Working |
| Punctuation | **Not implemented** (future work) |
| Morse speed | Fixed thresholds, not adaptive |

---

## 📌 Future Improvements (Important Suggestions)
You asked not to simply agree — so here are real critiques:

| Issue | Improvement |
|------|-------------|
| Morse speed is fixed | Add adaptive WPM estimation using exponential moving average |
| No punctuation | Extend lookup table with standard ITU punctuation |
| Analog stage uses breadboard | Move to PCB → improves noise immunity further |

---



