%option noyywrap
%{
#include "y.tab.h"
%}

letters [a-zA-Z_]
digits	[0-9]

%%
"for"							              return FOR;
"int"|"float"|"double"|"char" 	return TYPE;
"<"|">"|"<="|">="|"=="|"!="		  return OP;
{letters}({letters}|{digits})*	return ID;
{digits}+						            return NUM;
[ \t\n]+						            ;
.								                return *yytext;
%%
