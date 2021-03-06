%{
    #include <string.h>
    #include <stdio.h>
    #include <stdlib.h>
    extern int yylex();
    extern FILE * yyin;
    extern FILE * yyout;
    extern int yylineno;
    extern int error;
    extern char *yytext;

    int errores = 0;
    int erroractual = 0;
    void yyerror(const char *s);
%}

%locations

%token AND
%token BREAK
%token CONTINUE
%token DEF
%token ELIF
%token ELSE
%token FOR
%token IF
%token IMPORT
%token FROM
%token AS
%token IN
%token IS
%token NOT
%token OR
%token PASS
%token PRINT
%token RETURN
%token WHILE
%token RANGE
%token LEN

%token OP_MAS
%token OP_MENOS
%token OP_MULT
%token OP_EXP
%token OP_DIV
%token OP_DIVENT
%token OP_MOD
%token OP_LSHIFT
%token OP_RSHIFT
%token OP_BITAND
%token OP_OR
%token OP_BITXOR
%token OP_BITNOT
%token OP_MENORQUE
%token OP_MARYORQUE
%token OP_MENORIGUAL
%token OP_MAYORiGUAL
%token OP_IGUALQUE
%token OP_DIFERENTEDE
%token OP_DIFERENTEQUE

%token PARABRE
%token PARCIERRA
%token CORABRE
%token CORCIERRA
%token ASIGNACION
%token PUNTOCOMA
%token COMA
%token DOSPUNTOS
%token PUNTO
%token RSHIFTASIG
%token LSHIFTASIG
%token SUMAASIG
%token RESTAASIG
%token MULTASIG
%token DIVASIG
%token DIVENTASIG
%token BITANDASIG
%token BITORASIG
%token BITXORASIG
%token POTEASIG
%token MODASIG

%token BOOLEANO
%token STRING

%token NUMERO_L
%token ENTERO

%token IDENTIFICADOR

%token ERROR

%token NEWLINE

%start INICIO
%%

NUMERO: NUMERO_L | ENTERO;

NUEVALINEA:
NEWLINE
|;

INICIO: LINEA NUEVALINEA| INICIO LINEA NUEVALINEA;

LINEA: OPERACION
|LINE_ASIGNACION
|CICLO
|EXPRESION
|EXPRESIONBOOLEANA
|LINEAPRINT
|LINEAFUNCION
|CONDICIONALIF
|BREAK
|PASS
|CONTINUE
|IMPORTAR
|RETORNAR
|error {yyerrok;yyclearin;}
|VALORARRRAY
|;

VALORARRRAY:
IDENTIFICADOR CORABRE IDENTIFICADOR CORCIERRA
|VALORARRRAY CORABRE IDENTIFICADOR CORCIERRA
|IDENTIFICADOR CORABRE ENTERO CORCIERRA
|VALORARRRAY CORABRE ENTERO CORCIERRA
|IDENTIFICADOR CORABRE EXPRLEN CORCIERRA
|VALORARRRAY CORABRE EXPRLEN CORCIERRA
|IDENTIFICADOR CORABRE VALORARRRAY CORCIERRA
;

RETORNAR:
RETURN
|RETURN EXPRESION;

LINEAFUNCION: DEF IDENTIFICADOR PARABRE PARAMETROSFUNCION PARCIERRA DOSPUNTOS;

PARAMETROSFUNCION:

|ARGUMENTOSFUNCIONSINASIGNAR
|ARGUMENTOSFUNCIONASIGNADO
|OP_MULT IDENTIFICADOR
|OP_MULT OP_MULT IDENTIFICADOR;

ARGUMENTOSFUNCIONSINASIGNAR:
IDENTIFICADOR COMA
|IDENTIFICADOR
|IDENTIFICADOR COMA ARGUMENTOSFUNCIONSINASIGNAR;

ARGUMENTOSFUNCIONASIGNADO:
IDENTIFICADOR ASIGNACION EXPRESION COMA
|IDENTIFICADOR ASIGNACION EXPRESION
|IDENTIFICADOR ASIGNACION EXPRESION COMA ARGUMENTOSFUNCIONSINASIGNAR;

LINEAPRINT: PRINT PARABRE EXPRESION PARCIERRA
|PRINT PARABRE INE PARCIERRA;

OPERACION : OBJETO OPERADOR OBJETO
|OPERACION OPERADOR OPERACION
|PARABRE OPERACION PARCIERRA
|OPERACION OPERADOR OBJETO
|OBJETO OPERADOR OPERACION;

OPERADOR:  OP_MAS
|OP_MENOS
|OP_MULT
|OP_EXP
|OP_DIV
|OP_DIVENT
|OP_MOD
|OP_LSHIFT
|OP_RSHIFT
|OP_BITAND
|OP_OR
|OP_BITXOR
|OP_BITNOT
|OP_MENORQUE
|OP_MARYORQUE
|OP_MENORIGUAL
|OP_MAYORiGUAL
|OP_IGUALQUE
|OP_DIFERENTEDE
|OP_DIFERENTEQUE;

LINE_ASIGNACION: IDENTIFICADOR ASIGNACION EXPRESION;

EXPRESION:
PARABRE EXPRESION PARCIERRA
|OPERACION
|IDENTIFICADOR
|NUMERO
|BOOLEANO
|STRING
|ARRAY
|EXPRESIONBOOLEANA
|EXPRLEN;

EXPRLEN: LEN PARABRE OBJETOEXPRLEN PARCIERRA;

OBJETOEXPRLEN:
IDENTIFICADOR
|STRING
|ARRAY
|VALORARRRAY;

ARRAY: CORABRE INTERIORARRAY CORCIERRA;

INTERIORARRAY: OBJETO | INTERIORARRAY COMA OBJETO | ;

OBJETO:
IDENTIFICADOR
|NUMERO
|STRING
|BOOLEANO
|ARRAY
|VALORARRRAY;

CICLO: CICLOFOR | CICLOWHILE;

CICLOFOR: FOR IDENTIFICADOR IN IDENTIFICADOR DOSPUNTOS
|FOR IDENTIFICADOR IN ARRAY DOSPUNTOS
|FOR IDENTIFICADOR IN RANGE PARABRE INTERIORRANGE PARCIERRA DOSPUNTOS;

INTERIORRANGE:
VARIABLEINRANGE COMA VARIABLEINRANGE COMA VARIABLEINRANGE
|VARIABLEINRANGE COMA VARIABLEINRANGE COMA VARIABLEINRANGE COMA
|VARIABLEINRANGE COMA VARIABLEINRANGE
|VARIABLEINRANGE COMA VARIABLEINRANGE COMA
|VARIABLEINRANGE
|VARIABLEINRANGE COMA
|EXPRLEN;

IMPORTAR:
IMPORT IDENTIFICADOR
|IMPORT IDENTIFICADOR FROM IDENTIFICADOR
|IMPORT IDENTIFICADOR AS IDENTIFICADOR
|IMPORT IDENTIFICADOR FROM IDENTIFICADOR AS IDENTIFICADOR;

VARIABLEINRANGE:
ENTERO
|IDENTIFICADOR;

CICLOWHILE: WHILE EXPRESIONBOOLEANA DOSPUNTOS;

EXPRESIONBOOLEANA:
OPERACIONBOOLENA
|OPERACIONBOOLENA AND EXPRESIONBOOLEANA
|OPERACIONBOOLENA OR EXPRESIONBOOLEANA
;

OPERACIONBOOLENA:
OBJETO
| OBJETO OPERADORBOOLEANO OBJETO
;

OPERADORBOOLEANO:
OP_IGUALQUE
|OP_DIFERENTEDE
|OP_DIFERENTEQUE
|OP_MENORQUE
|OP_MENORIGUAL
|OP_MAYORiGUAL
|OP_MARYORQUE;

CONDICIONALIF:
IF BOOLEANO DOSPUNTOS
|IF PARABRE BOOLEANO PARCIERRA DOSPUNTOS
|IF EXPRESIONBOOLEANA DOSPUNTOS
|IF PARABRE EXPRESIONBOOLEANA PARCIERRA DOSPUNTOS;


INE:
OBJETO IN ARRAY
|OBJETO IN IDENTIFICADOR
|STRING IN STRING;

%%

void yyerror(const char *s) {
    if (erroractual != yylineno){
		fprintf(yyout,"Error | Linea: %d %s\n",yylineno,s);
        fprintf(stderr,"Error | Linea: %d %s\n",yylineno,s);
		erroractual = yylineno;
	}
    errores++;
}
int main(int argc, char *argv[]){
    if (argc == 2){
        yyin = fopen (argv[1], "r");
        yyout=fopen("salida.txt","w");

        if (yyin == NULL) {
            printf ("El fichero %s no se puede abrir\n", argv[1]);
            exit (-1);
        }else{
            while(!feof(yyin)){
                yyparse();
            }
            if(errores==0){
                fprintf(yyout, "No hubo ningun error sintactico.");
                fprintf(stderr, "No hubo ningun error sintactico.\n");
            }
        }

    }
}
