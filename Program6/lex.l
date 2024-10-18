%option noyywrap
%{
#include <string.h>
#include "y.tab.h"
%}

letters [a-zA-Z_]
digits  [0-9]

%%
{letters}({letters}|{digits})*  { yylval.expr = strdup(yytext); return ID; }
{digits}+                       { yylval.expr = strdup(yytext); return NUM; }
[-+*/()=]                       return yytext[0];
[\n]+                           return '\n';
.|[ \t]+                        ;
%%