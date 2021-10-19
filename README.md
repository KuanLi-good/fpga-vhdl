# fpga-vhdl

Implement a **processor** that can execute the following instructions.

| Operation  | Function performed | Description                                              |
| ---------- | ------------------ | -------------------------------------------------------- |
| load Rx, D | Rx ← D             | Load constant value D into Rx                            |
| mov Rx, Ry | Rx ← [Ry]          | Move contents of Ry into Rx                              |
| add Rx, Ry | Rx ← [Rx] + [Ry]   | Add contents of Rx and Ry and put result into Rx         |
| xor Rx, Ry | Rx ← [Rx] xor [Ry] | Bitwise XOR contents of Rx and Ry and put result into Rx |
| ldpc Rx    | [Rx] ← PC          | Load program counter into Rx                             |
| branch Rx  | Pc ← [Rx]          | Branch to address stored in Rx                           |



