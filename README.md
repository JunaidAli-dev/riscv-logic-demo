# RISC-V Logic & Iteration Demo

This repository contains a Bash-scripted version of Conway's Game of Life, submitted for the LFX Mentorship challenge (Broadening the RISC-V High Precision Code Base).

## Why this script?
To demonstrate core programming structures that are vital for testing underlying hardware architectures:

* **Heavy Iteration:** The simulation constantly runs nested loops to traverse the 2D grid and a sub-loop for the 3x3 neighbor checks.
* **Branching Logic:** Frequent state evaluations based on Conway's rules heavily utilize conditional branching. 
* **State Management:** Manipulates associative arrays to handle grid state transitions memory-efficiently.

When ported or run natively, these properties make it a solid, lightweight benchmark for testing the efficiency of RISC-V integer arithmetic and branch prediction.

## Usage
Give the script executable permissions and run it in any standard terminal:
```bash
chmod +x game_of_life.sh
./game_of_life.sh
