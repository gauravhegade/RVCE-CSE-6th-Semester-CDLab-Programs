%option noyywrap
%{
#include <string.h>
#include "y.tab.h"
%}

letters [a-zA-Z_]
digits  [0-9]

%%
"int"|"float"|"double"|"void"   { yylval.string = strdup(yytext); return TYPE; }
"return"                        { return RETURN; }
{letters}({letters}|{digits})*  { return ID; }
{digits}+                       { return NUM; }
[-+*=/(){},;]                   { return *yytext; }
[ \t\n]+                        ;
%%