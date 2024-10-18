%{
#include <stdio.h>
#include <stdlib.h>
#include "lex.yy.c"
extern FILE *yyin;

typedef char *string;
struct {
  string res, op1, op2;
  char op;
} code[100];

int idx = -1;

string add_to_table(string, string, char);
void quadruples();
%}

%union {
  char *expr;
}

%token <expr> ID NUM
%type <expr> EXPR ASSIGN

%left '+' '-'
%left '*' '/'

%%
STMTS : STMTS STMT | // epsilon
      ;
STMT : EXPR '\n'
     | ASSIGN '\n'
     ;
ASSIGN: ID '=' EXPR     { $$ = add_to_table($1, $3, '='); } 
      ;
EXPR : EXPR '+' EXPR    { $$ = add_to_table($1, $3, '+'); }
     | EXPR '-' EXPR    { $$ = add_to_table($1, $3, '-'); }
     | EXPR '*' EXPR    { $$ = add_to_table($1, $3, '*'); }
     | EXPR '/' EXPR    { $$ = add_to_table($1, $3, '/'); }
     | '(' EXPR ')'     { $$ = $2; }
     | ID
     | NUM
     ;
%%

void yyerror(const char *error) {
  perror(error);
  exit(1);
}

int main() {
  yyin = fopen("./input", "r");
  yyparse();

  printf("\nQuadruples:\n");
  quadruples();

  fclose(yyin);
  return 0;
}

string add_to_table(string op1, string op2, char op) {
  if (op == '=') {
    code[idx].res = op1;
    return op1;
  }

  idx++;
  string res = malloc(3);
  sprintf(res, "@%c", idx + 'A');
  code[idx].op1 = op1;
  code[idx].op2 = op2;
  code[idx].op = op;
  code[idx].res = res;

  return res;
}

void quadruples() {
  for(int i = 0; i <= idx; i++)
    printf("%d: %s %s %s %c\n", i, code[i].res, code[i].op1, code[i].op2, code[i].op);
}
