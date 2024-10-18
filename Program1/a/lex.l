%{
#include <stdio.h>
#include <stdlib.h>
int lines, words, chars, digits, whitespaces;
%}

%%

[a-zA-Z]+   { words++; chars += yyleng; }
[0-9]+      { digits++; chars++; }
\n+         { lines++; }
[ \t]       { whitespaces++; }
.           { chars++; }

%%

int main() {
  printf("Enter paragraph: \n");
  yylex();

  printf("Lines: %d\n", lines);
  printf("Words: %d\n", words);
  printf("Chars: %d\n", chars);
  printf("Digits: %d\n", digits);
  printf("Whitespaces: %d\n", whitespaces);

  return 0;
}
