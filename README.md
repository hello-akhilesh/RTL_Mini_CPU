# 🧠 Mini CPU Design 

## 📌 Project Overview
This project implements a simple  Mini CPU / Processor using Verilog HDL.
The processor is simulation-friendly and verified using Icarus Verilog + GTKWave.

## 🧩 Key CPU Components
* Instruction Fetch (IF)

* Program Counter (PC)

* Register File (RF)

* Arithmetic Logic Unit (ALU)

* Control Unit (FSM)

* Write-Back logic

## ⚙️ Mini CPU Features
* 4 General-Purpose Registers: R0 – R3

* 8-bit Instruction Format

* ALU Operations Supported:

  * ADD

  * SUB

  * AND

  * OR

* FSM-based Control Unit

* Sequential Execution: Fetch → Decode → Execute → Write-Back

* Preloaded Instruction Memory

* Fully synthesizable RTL

## 🧾 Instruction Format (8-bit)
| Bits | Field | Description |
|------|-------|-------------|
| 7–6  | Opcode | ALU operation |
| 5–4  | Rd     | Destination register |
| 3–2  | Rs1    | Source register 1 |
| 1–0  | Rs2 / Imm | Source register 2 / Immediate |

## 🔢 Opcode Encoding
| Opcode | Operation |
|--------|-----------|
| `00` | ADD |
| `01` | SUB |
| `10` | AND |
| `11` | OR |

## 🧠 Control Unit (FSM)

The Control Unit is implemented as a Finite State Machine (FSM) that controls instruction sequencing:

1. FETCH – Fetch instruction from instruction memory

2. DECODE – Decode opcode and register fields

3. EXECUTE – Perform ALU operation

4. WRITE-BACK – Store result into destination register

## 📁 Project Structure
Mini_CPU/     
│     
├── mini_cpu.v          
├── register_file.v     
├── alu.v               
├── control_unit.v      
├── tb_mini_cpu.v       
├── waveform.png        
└── README.md           
 

## 🧾 Module Description
## 📄 mini_cpu.v

* Integrates all submodules

* Connects PC, RF, ALU, and Control Unit

## 📄 register_file.v

* 4 registers (R0–R3)

* Two read ports, one write port

## 📄 alu.v

* Performs arithmetic and logic operations

* Controlled via opcode

## 📄 control_unit.v

* FSM controlling CPU stages

* Generates control signals for datapath

## 📄 tb_mini_cpu.v

* Generates clock and reset

* Loads sample instructions

* Verifies execution using waveform

## ▶️ Compile & Simulate (Icarus Verilog)
* iverilog -g2012 mini_cpu.v register_file.v alu.v control_unit.v tb_mini_cpu.v
* vvp a.out
* gtkwave mini_cpu.vcd


## 🛠 Tools Used

* Verilog HDL

* Icarus Verilog

* GTKWave

