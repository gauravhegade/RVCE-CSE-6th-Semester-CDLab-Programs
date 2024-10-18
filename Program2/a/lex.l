%{
#include <stdio.h>
int positive_integers = 0, negative_integers = 0, positive_fractions = 0, negative_fractions = 0; 
%}

digit [0-9]

%%

[-]{digit}+[/][-]{digit}+   { positive_fractions++; printf("Positive Fraction %s", yytext); }
[-]{digit}+[/][+]?{digit}+  { negative_fractions++; printf("Negative Fraction %s", yytext); }
[+]?{digit}+[/][-]{digit}+  { negative_fractions++; printf("Negative Fraction %s", yytext); }
[+]?{digit}+[/][+]?{digit}+ { positive_fractions++; printf("Positive Fraction %s", yytext); }
[-]{digit}+[.]{digit}+      { negative_fractions++; printf("Negative Fraction %s", yytext); }
[+]?{digit}+[.]{digit}+     { positive_fractions++; printf("Positive Fraction %s", yytext); }
[-]{digit}+                 { negative_integers++; printf("Negative Integer: %s", yytext); }
[+]?{digit}+                { positive_integers++; printf("Positive Integer: %s", yytext); }

%%

int main() {
  yyin = fopen("./input.txt", "r");
  yylex();

  printf("\n\nPositive Integers: %d\n", positive_integers);
  printf("Negative Integers: %d\n", negative_integers);
  printf("Positive Fractions: %d\n", positive_fractions);
  printf("Negative Fractions: %d\n", negative_fractions);

  return 0;
}
