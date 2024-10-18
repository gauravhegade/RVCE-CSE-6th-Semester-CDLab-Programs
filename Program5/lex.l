%option noyywrap
%{
#include "y.tab.h"
%}

letters [a-zA-Z_]
digits  [0-9]

%%

"int"|"float"|"char"|"double"	  { return TYPE; }
{letters}({letters}|{digits})*  { return ID; }
{digits}+                       { return NUM; }
[ \t\n]+                        ; 
.				                        { return *yytext; }
%%
