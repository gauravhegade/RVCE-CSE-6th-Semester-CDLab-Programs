%{
#include <stdio.h>
#include <stdlib.h>
#include "lex.yy.c"
%}

%%

S: A B         { printf("String accepted"); exit(0); }
 ;
A: 'a' A 'b' | // epsilon
  ;
B: 'b' B 'c' | // epsilon
 ;

%%

void yyerror(const char *error) {
  fprintf(stderr, "%s\n", error);
  exit(1);
}

int main() {
  printf("Enter strings: \n");
  yyparse();
  return 0;
}
