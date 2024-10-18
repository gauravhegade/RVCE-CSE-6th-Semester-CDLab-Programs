%{
#include <stdio.h>
#include <stdlib.h>
#include "lex.yy.c"
int total_loops, current_nesting, max_nesting;
%}

%token FOR ID NUM OP TYPE
%left '+' '-'
%left '*' '/'

%%
S : F	  { printf("\nValid Declaration\n"); }
  ;
F : FOR '(' DA ';' COND ';' S1 ')' 
  {
    total_loops++;
    if(++current_nesting > max_nesting) max_nesting = current_nesting;
  }
  BODY
  {
    current_nesting--;
  }
  ;
DA : DECL | ASSIGN | // epsilon
   ;
DECL : TYPE ID | TYPE ASSIGN
     ;
ASSIGN : ID '=' EXPR
       ;
COND : TERM OP TERM | 
     ;
TERM : ID | NUM
     ;
BODY : S1 ';' | '{' SS '}' | F | ';'
     ;
SS : S1 ';' SS | F SS | // epsilon
   ;
S1 : DECL | ASSIGN | EXPR
   ;
EXPR : EXPR '+' EXPR
     | EXPR '-' EXPR
     | EXPR '*' EXPR
     | EXPR '/' EXPR
     | EXPR '-' '-'
     | EXPR '+' '+'
     | '-' '-' EXPR
     | '+' '+' EXPR
     | TERM
     ;
%%

void yyerror(const char *error) {
  fprintf(stderr, "%s\n", error);
  exit(1);
}

int main() {
  printf("Enter code blocks:\n");
  yyparse();

  printf("Max Nesting: %d\n", max_nesting);
  printf("Total for loops: %d\n", total_loops);

  return 0;
}
