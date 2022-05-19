%{
    #include <stdio.h>
    #include "lab02_benavides_escolar_medina.tab.h"
    int error=0;

%}

%option yylineno

DIGITO [0-9]
LETRA [a-zA-Z]
IDENTIFICADOR ({LETRA}|"_")({LETRA}|{DIGITO}|"_")*

INTEGER ("+"|"-")?{DIGITO}+
LONGINTEGER {INTEGER}("L"|"l")
ENTERO {INTEGER}|{LONGINTEGER}
DECIMAL {DIGITO}+"."{DIGITO}*|"."{DIGITO}+|{DIGITO}+("."{DIGITO}+)?"e"("-")?{DIGITO}+
IMAGINARIO ({ENTERO}|{DECIMAL})("J"|"j")

NUMERO {DECIMAL}|{IMAGINARIO}

STRING "'"[^,\n]+"'"|"\""[^,\n]+"\""|("‘"|"’")[^,\n]+"’"
COMENTARIO "#"[^\n]*\n
BOOLEANO "True"|"False"

%%

"break" {return(BREAK);}
"and" {return(AND);}
"continue" {return(CONTINUE);}
"def" {return(DEF);}
"elif" {return(ELIF);}
"else" {return(ELSE);}
"for" {return(FOR);}
"if" {return(IF);}
"import" {return(IMPORT);}
"in" {return(IN);}
"is" {return(IS);}
"not" {return(NOT);}
"or" {return(OR);}
"pass" {return(PASS);}
"print" {return(PRINT);}
"return" {return(RETURN);}
"while" {return(WHILE);}
"range" {return(RANGE);}
"len" {return(LEN);}

"+" {return(OP_MAS);}
"-" {return(OP_MENOS);}
"*" {return(OP_MULT);}
"**" {return(OP_EXP);}
"/" {return(OP_DIV);}
"//" {return(OP_DIVENT);}
"%" {return(OP_MOD);}
"<<" {return(OP_LSHIFT);}
">>" {return(OP_RSHIFT);}
"&" {return(OP_BITAND);}
"|" {return(OP_OR);}
"^" {return(OP_BITXOR);}
"~" {return(OP_BITNOT);}
"<" {return(OP_MENORQUE);}
">" {return(OP_MARYORQUE);}
"<=" {return(OP_MENORIGUAL);}
">=" {return(OP_MAYORiGUAL);}
"==" {return(OP_IGUALQUE);}
"!=" {return(OP_DIFERENTEDE);}
"<>" {return(OP_DIFERENTEQUE);}

"(" {return(PARABRE);}
")" {return(PARCIERRA);}
"[" {return(CORABRE);}
"]" {return(CORCIERRA);}
"=" {return(ASIGNACION);}
";" {return(PUNTOCOMA);}
"," {return(COMA);}
":" {return(DOSPUNTOS);}
"." {return(PUNTO);}
">>=" {return(RSHIFTASIG);}
"<<=" {return(LSHIFTASIG);}
"+=" {return(SUMAASIG);}
"-=" {return(RESTAASIG);}
"*=" {return(MULTASIG);}
"/=" {return(DIVASIG);}
"//=" {return(DIVENTASIG);}
"&=" {return(BITANDASIG);}
"|=" {return(BITORASIG);}
"^=" {return(BITXORASIG);}
"**=" {return(POTEASIG);}
"%=" {return(MODASIG);}


{BOOLEANO} {return(BOOLEANO);}

{STRING} {return(STRING);}

{ENTERO} {return(ENTERO);}

{NUMERO} {return(NUMERO_L);}

{IDENTIFICADOR} {return(IDENTIFICADOR);}

{COMENTARIO} {}

" " {}

[\n] {return(NEWLINE);}

[\t] {}

. {return(ERROR);}


%%
