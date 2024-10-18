%{
#include <stdio.h>
#include <stdlib.h>
#include "lex.yy.c"

int total_ifs, max_nesting, current_nesting;
%}

%token IF OP NUM ID TYPE

%left '+' '-'
%left '*' '/'

%%
S: IF_STMT
 ;
IF_STMT : IF '(' COND ')' 
        {
            total_ifs++;
            if(++current_nesting > max_nesting) max_nesting = current_nesting;
        }
        BODY
        {
            current_nesting--;
        }
        ;
BODY: S1 ';' | '{' SS '}' | IF_STMT
    ;
SS: S1 ';' SS | IF_STMT SS | // epsilon
  ;
S1: DA | EXPR
  ;
DA: DECL | ASSIGN
  ;
DECL: TYPE ID | TYPE ASSIGN
    ;
ASSIGN: ID '=' EXPR
      ;
COND: TERM OP TERM
    ;
TERM: ID | NUM
;
EXPR: EXPR '+' EXPR
    | EXPR '-' EXPR
    | EXPR '*' EXPR
    | EXPR '/' EXPR
    | TERM
    ;
%% 

int yyerror(char *err) {
    fprintf(stderr, "%s\n", err);
    exit(1);
}

int main() {
    printf("Enter code snippets: \n");
    yyparse();

    printf("Total ifs: %d\n", total_ifs);
    printf("Max Nesting Level: %d\n", max_nesting);

    return 0;
}

