#!/bin/bash
echo ""
echo "Laboratorio 2 | Analizador sintáctico de un programa en lenguaje Python"
echo ""

rm -rf salida.txt lab02_benavides_escolar_medina.tab.c lab02_benavides_escolar_medina.tab.h lex.yy.c
bison -d lab02_benavides_escolar_medina.y
flex lab02_benavides_escolar_medina.l

echo "**"
echo "Generando ejecutable..."
gcc lab02_benavides_escolar_medina.tab.c lex.yy.c -o lab02_benavides_escolar_medina -ll

echo ""
echo "Ejecutando..."
./lab02_benavides_escolar_medina $1