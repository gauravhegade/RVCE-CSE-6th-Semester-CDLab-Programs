%{
#include <stdio.h>
#include <stdlib.h>
#include "lex.yy.c"
extern FILE *yyin;

typedef char *string;
struct {
  string op1, op2, res;
  char op;
} code[100];

int idx = -1;

string add_to_table(string, string, char);
void assembly_code();
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
  yyin = fopen("input", "r");
  yyparse();

  assembly_code();

  return 0;
}

string add_to_table(string op1, string op2, char op) {
  if(op == '=') {
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

void assembly_code() {
  for(int i = 0; i <= idx; i++) {
    string instruction;
    switch(code[i].op) {
      case '+': instruction = "ADD"; break;
      case '-': instruction = "SUB"; break;
      case '*': instruction = "MUL"; break;
      case '/': instruction = "DIV"; break;
    }

    printf("LOAD R1, %s\n", code[i].op1);
    printf("LOAD R2, %s\n", code[i].op2);
    printf("%s R3, R1, R2\n", instruction);
    printf("STR R3, %s\n", code[i].res);
  }
}

