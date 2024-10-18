%{
#include <stdio.h>
#include <stdlib.h>
int single_line_comments, multi_line_comments, mlines;
%}

%%

\/\*([^*]|\*+[^*/])*\*+\/   { 
                              multi_line_comments++; 
                              for(int i = 0; i < yyleng; i++) if(yytext[i] == '\n') mlines++;
                            }
\/\/.*                      { single_line_comments++; }
.                           { fprintf(yyout, "%s", yytext); }

%%

int main() {
  yyin = fopen("./input.c", "r");
  yyout = fopen("./output.c", "w");
  yylex();

  printf("Single Line Comments: %d\n", single_line_comments);
  printf("Multi Line Comments: %d\n", multi_line_comments);
  printf("Lines within the multilines: %d\n", mlines + multi_line_comments);

  return 0;
}
