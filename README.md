# C to MIPS compiler
-------------------
Compiler written in Java that compiles a subset of the C language to [MIPS assembly code](https://en.wikipedia.org/wiki/MIPS_architecture).

## Requirements
1. Unix based OS
2. Java JDK version 11... need `javac` and `java` commands
3. `make` command installed
4. Install [Spim](https://en.wikipedia.org/wiki/SPIM#:~:text=SPIM%20is%20a%20MIPS%20processor,the%20University%20of%20Wisconsin%E2%80%93Madison.) with `sudo apt-get install spim`

## Instructions
1. run `make` in terminal
2. write c code in `test.wumbo`
3. run `make test` in terminal
4. MIPS assembly code will output in `test.s`
5. run `spim` in terminal
6. run `load "test.s"` in spim
7. run `run` in spim and the program should run in terminal

any questions please email max@maxma.io
