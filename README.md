# FPGA Stopwatch (DE10-Lite, Verilog)

[![Quartus](https://img.shields.io/badge/Intel-Quartus%20Prime-blue)](#)
[![FPGA](https://img.shields.io/badge/Board-DE10--Lite-forestgreen)](#)
[![Language](https://img.shields.io/badge/HDL-Verilog-black)](#)

Verilog implements a 2-digit BCD stopwatch that counts per second.
Modules: `clk_div` (1 Hz divider), `Bcd_test` (00–59 BCD counter), `seg7` (7-segment decoder), `BcdCounter` (top), and `Tb_BcdCounter` (testbench).

---

## Features
- **Accurate 1 Hz clock division** from 50 MHz board clock
- **00–59 BCD counting** with carry and reset logic
- **Dual 7-segment display output**
- **Complete testbench** for functional verification

---

## Architecture

## Usage
en=1 → count from 00 to 59 at 1 Hz  
rst=1 → reset to 00 immediately  
Can be extended to minutes/hours by cascading BCD counters  

## Testbench Notes
Includes multiple rst/en timing scenarios  
Use synchronous reset to avoid glitches  
Adjustable clk period for simulation speed  
