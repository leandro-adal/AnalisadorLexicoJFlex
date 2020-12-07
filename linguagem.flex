package main;
import java_cup.runtime.*;

%%

%{

/*-*
	* funcoes e variaveis
	*/

private void imprimir(String descricao, String lexema) {
	System.out.println(String.format("%-25s", lexema)+ descricao);
	
}

%}

/*-*
	* classe gerada
	*/
	
%public
%class AnalisadorLexico
%type void


/*-*
	* definicoes regulares
	*/
BRANCO = [\n|\s|\t]
LETTER = [A-Za-z]
NUMEROS = [0-9]
INTEIROS = {NUMEROS}+
PONTOFLUTUANTE = {INTEIROS}"."{NUMEROS}*
ID = ({LETTER}|_)+({LETTER}|{NUMEROS}_)*

%%

"import"					{ imprimir("Palavra reservada import", yytext()); }
"input"						{ imprimir("Palavra reservada input", yytext()); }
"print"						{ imprimir("Palavra reservada print", yytext()); }
"class"						{ imprimir("Palavra reservada class", yytext()); }
"def"						{ imprimir("Palavra reservada def", yytext()); }
"return"					{ imprimir("Palavra reservada return", yytext()); }
"break"						{ imprimir("Palavra reservada break", yytext()); }
"if"                      	{ imprimir("Palavra reservada if", yytext()); }
"elif"						{ imprimir("Palavra reservada elif", yytext()); }
"else"						{ imprimir("Palavra reservada else", yytext()); }
":"                    		{ imprimir("Palavra reservada then (Então)", yytext()); }
"for"						{ imprimir("Palavra reservada for", yytext()); }
"while"						{ imprimir("Palavra reservada while", yytext()); }
"in"						{ imprimir("Palavra reservada in", yytext()); }
"("							{ imprimir("Delimitador Inicial (", yytext()); }
")"							{ imprimir("Delimitador Final )", yytext()); }
","							{ imprimir("Separador de variavel", yytext()); }
";"							{ imprimir("Fim da Instrução", yytext()); }
"."							{ imprimir("Referência", yytext()); }
"="							{ imprimir("Atribuição", yytext()); }
"<="						{ imprimir("Operador Menor igual", yytext()); }
">="						{ imprimir("Operador Maior igual", yytext()); }
"<"							{ imprimir("Operador Menor que", yytext()); }
">"							{ imprimir("Operador Maior que", yytext()); }
"True"						{ imprimir("Palavra Reservada", yytext()); }
"False"						{ imprimir("Palavra Reservada", yytext()); }
"and"						{ imprimir("Palavra Reservada", yytext()); }
"or"						{ imprimir("Palavra Reservada", yytext()); }
"=="						{ imprimir("Operador Igualdade", yytext()); }
"**"						{ imprimir("Operador Exponenciação", yytext()); }
"%"							{ imprimir("Operador de Resto", yytext()); }
"/"							{ imprimir("Operador de Divisão", yytext()); }
"*"							{ imprimir("Operador de Multiplicação", yytext()); }
"+"							{ imprimir("Operador de Adição", yytext()); }
"-"							{ imprimir("Operador de Subtração", yytext()); }
\'({NUMEROS}|{LETTER}|{BRANCO})*\'	{ imprimir("String", yytext()); }
{BRANCO} 					{  }		
{ID} 						{ imprimir("Identificador", yytext()); }
{INTEIROS} 					{ imprimir("Número Inteiro", yytext()); }
{PONTOFLUTUANTE}			{ imprimir("Ponto Flututante", yytext()); }
\#(.)*						{ imprimir("Comentario", yytext()); }
\'\'\'({NUMEROS}|{LETTER}|{ID}|{BRANCO})*\'\'\' { imprimir("Comentarios multi linha", yytext()); }