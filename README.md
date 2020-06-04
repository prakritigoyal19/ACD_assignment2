# ACD
Follows the following grammar:

STMTS   : STMTS STMT
        |   epsilon
	
STMT  	:  ;
	|   EXPR;
	|   IF (EXPR) STMT 
	|   IF (EXPR) STMT ELSE STMT
	|   FOR (EXPR ; EXPR ; EXPR) STMT
	|   {STMTS}


# Instructions to compile the program:

- Type `make` in the terminal.
- This will create the executable file in the directory.

# Instructions to run the program:

- Run ./a.out testFileName

