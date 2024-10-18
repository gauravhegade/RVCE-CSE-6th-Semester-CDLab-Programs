%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "lex.yy.c"

int is_void_func = 0;
int has_return_stmt = 0;

void check_return_statement() {
  if (!is_void_func && !has_return_stmt) {
    fprintf(stderr, "Error: Non-void function must have a return statement.\n");
    exit(1);
  }
}
%}

%union {
  char *string;
}

%token RETURN ID NUM
%token <string> TYPE

%right '='
%left '+' '-'
%left '*' '/'

%%

S: FUN     { printf("Valid Declaration\n"); exit(0); }
 ;
FUN: TYPE ID '(' PARAMS_LIST ')' '{' BODY '}' 
   {
      if (strcmp($1, "void") == 0) is_void_func = 1;
      else is_void_func = 0;
      check_return_statement();
   }
   ;
PARAMS_LIST: PARAMS
           |
           ;
PARAMS: PARAM
      | PARAM ',' PARAMS
      ;
PARAM: TYPE ID
     ;
BODY: STMT_LIST
    |
    ;
STMT_LIST: STMT
         | STMT_LIST STMT
         ;
STMT: DA ';'
    | EXPR ';'
    | RETURN EXPR ';' { has_return_stmt = 1; }
    ;
DA: DECL | ASSIGN
  ;
DECL: PARAM | TYPE ASSIGN
    ;
ASSIGN: ID '=' EXPR
      ;
EXPR: EXPR '+' EXPR
    | EXPR '-' EXPR
    | EXPR '*' EXPR
    | EXPR '/' EXPR
    | ID
    | NUM
    ;
%%

void yyerror(const char *error) {
  perror(error);
  exit(1);
}

int main() {
  printf("Enter functions to recognize:\n");
  yyparse();
}

