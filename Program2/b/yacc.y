%{
#include <stdio.h>
#include <stdlib.h>
#include "lex.yy.c"
%}

%token NUM
%left '+' '-'
%left '*' '/'

%%
S : E ;       { printf("%d\n",$$); exit(0); }
E : E '+' E   { $$ = $1 + $3; printf("+ "); }
  | E '-' E   { $$ = $1 - $3; printf("- "); }
  | E '*' E   { $$ = $1 * $3; printf("* "); }
  | E '/' E   {
                if($3==0) {
                  yyerror("Divide by zero error!");
                }
                $$ = $1 / $3;
                printf("/ ");
              }
  | NUM       { $$ = $1; printf("%d ", $1); }
  ;
%%

void yyerror(const char *error) {
  fprintf(stderr, "%s\n", error);
  exit(1);
}

int main() {
  printf("Enter an arithmetic expression: \n");
  yyparse();

  return 0;
}
