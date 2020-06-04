# ACD
Written parser for given grammer for partial fulfillment of the course Automata and Compiler Design.

# Instructions to run the program:

## Run the commands:

- Run the following in a shell:
  - `lex lexer.l`
  - `yacc -d parser.y`
  - `gcc lex.yy.c y.tab.c`
- This will create the executable file in the directory.

## Using the makefile

- Type `make` in the shell.
- This will create the executable file in the directory.
