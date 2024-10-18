# Compiler Design Lab (21CS63) Programs
This repository contains a collection of LEX and YACC programs for the Compiler Design Lab course (21CS63). The programs include lexical analysis tasks like counting words, lines, and identifiers, and syntax analysis tasks such as validating expressions, recognizing control structures, and generating intermediate and assembly code. Each program comes with detailed compilation and execution steps to help you get started.

Contents:
- LEX programs for lexical analysis.
- YACC programs for syntax analysis.
- Compilation instructions for both LEX and YACC programs.
#### Feel free to explore and contribute!

## List of Programs

| No. | Program Description                                                                                                  | Link                |
| --- | -------------------------------------------------------------------------------------------------------------------- | ------------------- |
| 1   | Write a LEX program to count the number of words, lines, characters, and whitespaces in a given paragraph.           | [Link](https://github.com/gauravhegade/RVCE-CSE-6th-Semester-CDLab-Programs/tree/main/Program1/a) |
|     | Write a YACC program to recognize strings of the form a<sup>n</sup>b<sup>n+m</sup>c<sup>m</sup>, where n, m ≥ 0.     | [Link](https://github.com/gauravhegade/RVCE-CSE-6th-Semester-CDLab-Programs/tree/main/Program1/b) |
| 2   | Write a LEX program to count the number of positive & negative integers and fractions.                               | [Link](https://github.com/gauravhegade/RVCE-CSE-6th-Semester-CDLab-Programs/tree/main/Program2/a) |
|     | Write a YACC program to validate and evaluate a simple expression involving the operators `+`, `-`, `*`, and `/`.    | [Link](https://github.com/gauravhegade/RVCE-CSE-6th-Semester-CDLab-Programs/tree/main/Program2/b) |
| 3   | Write a LEX program to count comment lines in a C program, eliminate them, and copy the rest into a new file.        | [Link](https://github.com/gauravhegade/RVCE-CSE-6th-Semester-CDLab-Programs/tree/main/Program3/a) |
|     | Write a YACC program to recognize a nested `FOR` loop (minimum 3 levels) in the C language.                          | [Link](https://github.com/gauravhegade/RVCE-CSE-6th-Semester-CDLab-Programs/tree/main/Program3/b) |
| 4   | Write a LEX program to recognize and count the number of identifiers, operators, and keywords in an input file.      | [Link](https://github.com/gauravhegade/RVCE-CSE-6th-Semester-CDLab-Programs/tree/main/Program4/a) |
|     | Write a YACC program to recognize nested `IF` statements in C and display the number of levels of nesting.           | [Link](https://github.com/gauravhegade/RVCE-CSE-6th-Semester-CDLab-Programs/tree/main/Program4/b) |
| 5   | Write a YACC program to recognize declaration statements in C and display the number of variables declared.          | [Link](https://github.com/gauravhegade/RVCE-CSE-6th-Semester-CDLab-Programs/tree/main/Program5) |
| 6   | Write a YACC program that reads C statements from an input file and converts them into quadruple three-address code. | [Link](https://github.com/gauravhegade/RVCE-CSE-6th-Semester-CDLab-Programs/tree/main/Program6) |
| 7   | Write a YACC program to identify function definitions in the C language.                                             | [Link](https://github.com/gauravhegade/RVCE-CSE-6th-Semester-CDLab-Programs/tree/main/Program7) |
| 8   | Write a YACC program to generate assembly code for a valid arithmetic expression.                                    | [Link](https://github.com/gauravhegade/RVCE-CSE-6th-Semester-CDLab-Programs/tree/main/Program8) |

## Compilation Steps

#### Prerequisites
1. Ensure that `#include "lex.yy.c"` is added to your YACC program, and `#include "y.tab.h"` is added to your LEX program.
2. Ensure that `%option noyywrap` is added to all LEX programs.

### For YACC Programs
1. Compile the YACC program:
   ```bash
   $ yacc <filename>.y -d
   ```

2. Compile the LEX program:
   ```bash
   $ lex <filename>.l
   ```

3. Compile the parser:
   ```bash
   $ gcc y.tab.c -o parser
   ```

4. Run the parser:
   ```bash
   $ ./parser
   ```

### For LEX Programs
1. Compile the LEX program:
   ```bash
   $ lex <filename>.l
   ```

2. Compile the lexer:
   ```bash
   $ gcc lex.yy.c -o lexer
   ```

3. Run the lexer:
   ```bash
   $ ./lexer
   ```
