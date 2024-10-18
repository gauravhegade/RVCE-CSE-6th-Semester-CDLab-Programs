%{
#include <stdio.h>
#include <stdlib.h>
#include "lex.yy.c"

int var_count = 0;
%}

%token TYPE ID NUM

%%
S: DECLARATION { printf("Total variables declared: %d\n", var_count); exit(0); }
 ;
DECLARATION: TYPE VAR_LIST ';'
           | TYPE VAR_LIST ';' DECLARATION 
           ;
VAR_LIST: VAR
	      | VAR ',' VAR_LIST
	      ;
VAR: ID C             { var_count++; }
   | ID '=' NUM	      { var_count++; }
   | ID '=' ID	      { var_count++; }
   ;
C: '[' NUM ']' C | // epsilon
 ;
%%

int yyerror(char *error) {
  fprintf(stderr, "Error: %s\n", error);
  exit(1);
}

int main() {
  printf("Enter a declaration statement: \n");
  yyparse();
  return 0;
}

