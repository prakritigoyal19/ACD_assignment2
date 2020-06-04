/*
Written parser to accept a token from lexer with given grammer. 
*/

%{ 

/* Definition section */

    int yyerror(const char* s);
    int yylex();
	#include "stdio.h"
	#include "stdlib.h"
	#include "ctype.h"
	#include "string.h"
    int success = 1; 
    int errors = 0;
    int yycolumn = 0;
      
%} 
  
%union { 
   char* f; 
} 

%token IF FOR IDEN U_OP OP NUM 
%token INT CHAR FLOAT
%token RETURN MAIN
%nonassoc LOWER_THAN_ELSE
%nonassoc ELSE

%%
   STMTS :   STMTS STMT
         |   %empty
         ;
   STMT  :   ';'
         |   EXPR ';'
         |   IF '('EXPR')' STMT  %prec LOWER_THAN_ELSE
         |   IF '('EXPR')' STMT ELSE STMT
         |   FOR '('EXPR';'EXPR';'EXPR')' STMT
         |   '{'STMTS'}'
	 |   INT MAIN 
         ;
   EXPR  :  TERM
         |  IDEN U_OP
         |  U_OP IDEN
         |  TERM OP EXPR
         |  IDEN '=' EXPR
	 |  INT IDEN
	 |  CHAR IDEN
	 |  FLOAT IDEN
         ;
   
   TERM  :  IDEN
         |  NUM
         ;
    
%% 

extern FILE *yyin;

int main(int argc , char **argv) {
    yyin = fopen(argv[1], "r");
    yyparse();
    if(success) {
        printf("OK\n");
    }
    else {
        printf("\n%d error(s) occured\n", errors);
    }
    return 0;
}

int yyerror(const char *msg) {
    extern char* yytext;
    extern int yylineno;
    extern int yycolumn;
    printf("\nError occured at column %d of the line %d near '%s'\nError: %s\n", yycolumn, yylineno, yytext, msg);
    errors++;
    success = 0;
    return 1;
}
