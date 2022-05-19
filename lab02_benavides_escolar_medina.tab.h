/* A Bison parser, made by GNU Bison 3.5.1.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015, 2018-2020 Free Software Foundation,
   Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* Undocumented macros, especially those whose name start with YY_,
   are private implementation details.  Do not rely on them.  */

#ifndef YY_YY_LAB02_BENAVIDES_ESCOLAR_MEDINA_TAB_H_INCLUDED
# define YY_YY_LAB02_BENAVIDES_ESCOLAR_MEDINA_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    AND = 258,
    BREAK = 259,
    CONTINUE = 260,
    DEF = 261,
    ELIF = 262,
    ELSE = 263,
    FOR = 264,
    IF = 265,
    IMPORT = 266,
    FROM = 267,
    AS = 268,
    IN = 269,
    IS = 270,
    NOT = 271,
    OR = 272,
    PASS = 273,
    PRINT = 274,
    RETURN = 275,
    WHILE = 276,
    RANGE = 277,
    LEN = 278,
    OP_MAS = 279,
    OP_MENOS = 280,
    OP_MULT = 281,
    OP_EXP = 282,
    OP_DIV = 283,
    OP_DIVENT = 284,
    OP_MOD = 285,
    OP_LSHIFT = 286,
    OP_RSHIFT = 287,
    OP_BITAND = 288,
    OP_OR = 289,
    OP_BITXOR = 290,
    OP_BITNOT = 291,
    OP_MENORQUE = 292,
    OP_MARYORQUE = 293,
    OP_MENORIGUAL = 294,
    OP_MAYORiGUAL = 295,
    OP_IGUALQUE = 296,
    OP_DIFERENTEDE = 297,
    OP_DIFERENTEQUE = 298,
    PARABRE = 299,
    PARCIERRA = 300,
    CORABRE = 301,
    CORCIERRA = 302,
    ASIGNACION = 303,
    PUNTOCOMA = 304,
    COMA = 305,
    DOSPUNTOS = 306,
    PUNTO = 307,
    RSHIFTASIG = 308,
    LSHIFTASIG = 309,
    SUMAASIG = 310,
    RESTAASIG = 311,
    MULTASIG = 312,
    DIVASIG = 313,
    DIVENTASIG = 314,
    BITANDASIG = 315,
    BITORASIG = 316,
    BITXORASIG = 317,
    POTEASIG = 318,
    MODASIG = 319,
    BOOLEANO = 320,
    STRING = 321,
    NUMERO_L = 322,
    ENTERO = 323,
    IDENTIFICADOR = 324,
    ERROR = 325,
    NEWLINE = 326
  };
#endif

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif

/* Location type.  */
#if ! defined YYLTYPE && ! defined YYLTYPE_IS_DECLARED
typedef struct YYLTYPE YYLTYPE;
struct YYLTYPE
{
  int first_line;
  int first_column;
  int last_line;
  int last_column;
};
# define YYLTYPE_IS_DECLARED 1
# define YYLTYPE_IS_TRIVIAL 1
#endif


extern YYSTYPE yylval;
extern YYLTYPE yylloc;
int yyparse (void);

#endif /* !YY_YY_LAB02_BENAVIDES_ESCOLAR_MEDINA_TAB_H_INCLUDED  */
