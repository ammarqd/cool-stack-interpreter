# COOL-Stack-Machine
A simple stack machine for the COOL programming language.

The eventual goal is to build a compiler for the COOL programming language by becoming familiar with the syntax.

<br>

The language of the stack machine is defined below:

| Command | Meaning                                   |
| ------- | ----------------------------------------- |
| *int*   | push the integer *int* on the stack       |
| +       | push a '+' on the stack                   |
| s       | push an 's' on the stack                  |
| e       | evaluate the top of the stack (see below) |
| d       | display contents of the stack             |
| x       | stop                                      | 

<br>

To compile and run the code:

Define the environment variable ```$COOL_HOME``` and set it to refer to the main directory

Add the following two directories to your PATH environment variable:
1. Add ```$COOL HOME/bin/.orig/.Darwin``` if you are on a Mac, or ```$COOL HOME/bin/.orig/.Linux```
otherwise. This is for the reference COOL compiler (coolc) and SPIM tools (coolspim).
2. Add ```$COOL HOME/bin```. This is for the build, execution and testing scripts (e.g., buildme, testme)
that you will need to use for all A0{A3.

Finally run the following two commands within the ```assignments/pa0 directory```:
```
coolc stack.cl atoi.cl
coolspim -file stack.s < stack.test
```



