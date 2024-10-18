%option noyywrap
%{
#include "y.tab.h"
%}

letters [a-zA-Z_]
digits  [0-9]

%%
"if"                            { return IF; }
"int"|"float"|"double"|"bool"   { return TYPE; }
">"|"<"|">="|"<="|"=="|"!="     { return OP; }
{letters}({letters}|{digits})*  { return ID; }
{digits}+                       { return NUM; }
[ \t\n]+                        ;
.                               { return yytext[0]; }
%%