%option noyywrap
%{
#include "y.tab.h"
%}

%%

'a' return 'a';
'b' return 'b';
'c' return 'c';
.   return *yytext;
\n  return 0;

%%
