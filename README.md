#  C and Assembly Programming Exercises

##  Overview
This project consists of four programs written in **C** and **Assembly language**.  
Each program focuses on different fundamental concepts — including loops, arithmetic operations, and the integration of Assembly with C.  
Together, they demonstrate how both languages can be used to perform low-level computations and high-level input/output operations efficiently.

---

## 1️ C Program – Factorial of a Number
This program is written purely in C.  
It prompts the user to enter a positive integer, then calculates its factorial using a `for` loop.  

The loop multiplies the numbers from 1 up to the entered number, storing the cumulative result in a variable.  
Finally, the program prints the factorial on the screen.

This example demonstrates:
- Using loops in C (`for` loop)
- Handling user input with `scanf`
- Printing formatted output with `printf`
- Working with large integer values using the `long long` data type

---

## 2️ Assembly Program – Add Numbers from 15 to 25
This Assembly program calculates the **sum of all integers from 15 to 25** using an **incrementing loop**.

Here’s how it works conceptually:
- A register is initialized with the value 15.
- Another register (the accumulator) is set to zero to hold the total sum.
- The program repeatedly adds the current value to the accumulator and increments it by one.
- The loop continues until the value reaches 25.

Once the loop finishes, the final sum is stored in memory.  
The program then converts the result into a human-readable decimal string and prints it to the terminal using Linux system calls.

This demonstrates:
- The use of registers for arithmetic operations
- Looping with `inc` (increment) and `cmp` (compare) instructions
- Performing output using Linux system interrupts (`int 0x80`)

---

## 3️ Assembly Program – Add Numbers from 25 Down to 15
This program performs a similar task to the previous one but in reverse order.  
It calculates the sum of numbers **from 25 down to 15** using a **decrementing loop**.

Here’s what happens conceptually:
- The loop starts at 25 and adds the current value to the accumulator each time.
- The value is then decremented by one on each iteration.
- The loop continues until it reaches 15.

After calculating the total, the program converts the number into a string and displays it on the screen, just like the previous version.  
However, this version demonstrates the use of the **`dec` (decrement)** instruction to control the loop flow.

Key learning outcomes:
- Use of decrementing loops in Assembly
- Comparison and conditional jumps using `cmp` and `jne`
- Output handling with system calls

---

## 4️ Factorial Program – Assembly (Called from C)
This final part combines both **C** and **Assembly**.  
It demonstrates how a C program can call an Assembly function to perform a calculation.

The Assembly function implements the **factorial algorithm** using a loop:
- It receives a number `n` as a function argument.
- It multiplies all integers from `n` down to 1 to compute the factorial.
- The final result is stored in a register and returned to the C program.

The C program handles user input and output:
- It asks the user to enter a number.
- It calls the Assembly function with that number.
- It then displays the factorial returned by the function.

This combined approach shows how **high-level C** code and **low-level Assembly** can work together, allowing performance-critical parts to be written in Assembly while maintaining user-friendly input and output through C.

Learning highlights:
- Function calling conventions between C and Assembly (64-bit)
- Register usage for passing parameters and returning results
- Integration of compiled Assembly object files with C via GCC

---

##  Key Learning Points
Across all four programs, you learn:
- How loops (`for`, `inc`, `dec`) are implemented in both C and Assembly  
- Performing arithmetic operations using registers  
- How data is stored, accessed, and converted for output  
- The difference between **32-bit** (Assembly with `int 0x80`) and **64-bit** (Assembly callable from C) programs  
- Linking and running Assembly with C using GCC and NASM

---

##  Requirements
To run and test these programs, you need:
- A Linux operating system (preferably 64-bit)
- The **NASM assembler** to compile Assembly code
- The **GCC compiler** to compile C programs and link Assembly object files

