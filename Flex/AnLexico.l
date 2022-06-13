%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
//#include <conio.h>
FILE *yyin;
%}

%option noyywrap
%option yylineno

%{
/*
	PALABRAS RESERVADAS
*/
%}

BOLt	bool
CARt	car
CADt	cad
LST		lista
SIS		si
SIN		sino
MNTS	mientras
HAZ		haz
DSD		desde
HST		hasta
MSTR	muestra
LEE		leer
GRP		grupo
NULL	null
PRM		programa
VRS		variables
FVRS	fvars
RTRN 	regresa
TRU		true
FAL		false

%{
/*
	VARIABLES
*/
%}

BOL		[TRU|FAL]
INT		[0-9]+
REL		((\+|-)?([0-9]+)(\.[0-9]+)?)|((\+|-)?\.?[0-9]+)
CAR		\'[a-z|A-Z|\d]\'
CAD		\"[^\n"]*\"
ID		[a-z|A-Z]([a-z|A-Z|\d])*

%{
/*
	SIMBOLOS
*/
%}
MAS		(\+)
MNS		(\-)
MLT		(\*)
DIV		(\/)
RES		(\%)
POT		(\^)
MNR		(\<)
MNG		(\<\=)
MYR		(\>)
MYG		(\>\=)
CMP		(\=\=)
DIF		(\<\>)
ASG		(\=)
PYC		(\;)
ABRP	(\()
CIEP	(\))
ABLL	(\{)
CILL	(\})
ABRC	(\[)
CIEC	(\])
COMA	(\,)
AND		(\&)
OR		[\?]
NOT		(\!)
COMM	(\#[^\n]*)
PNT		(\.)

%%

"num"		{ return INTt; }
"real"		{ return RELt; }
{BOLt}		{ return(BOLt); }
{CARt}		{ return(CARt); }
{CADt}		{ return(CADt); }
{LST}		{ return(LST); }
{SIS}		{ return(SIS); }
{SIN}		{ return(SIN); }
{MNTS}		{ return(MNTS); }
{HAZ}		{ return(HAZ); }
{DSD}		{ return(DSD); }
{HST}		{ return(HST); }
{MSTR}		{ return(MSTR); }
{LEE}		{ return(LEE); }
{GRP}		{ return(GRP); }
{NULL}		{ return(NULL); }
{PRM}		{ return(PRM); }
{VRS}		{ return(VRS); }
{RTRN}		{ return(RTRN); }

{INT}		{ return(INT); }
{REL}		{ return(REL); }
{BOL}		{ return(BOL); }
{CAR}		{ return(CAR); }
{CAD}		{ return(CAD); }
{ID}		{ return(ID); }

{MAS}		{ return(MAS); }
{MNS}		{ return(MNS); }
{MLT}		{ return(MLT); }
{DIV}		{ return(DIV); }
{RES}		{ return(RES); }
{POT}		{ return(POT); }
{MNR}		{ return(MNR); }
{MNG}		{ return(MNG); }
{MYR}		{ return(MYR); }
{MYG}		{ return(MYG); }
{CMP}		{ return(CMP); }
{DIF}		{ return(DIF); }
{ASG}		{ return(ASG); }
{PYC}		{ return(PYC); }
{ABRP}		{ return(ABRP); }
{CIEP}		{ return(CIEP); }
{ABLL}		{ return(ABLL); }
{CILL}		{ return(CILL); }
{ABRC}		{ return(ABRC); }
{CIEC}		{ return(CIEC); }
{COMA}		{ return(COMA); }
{AND}		{ return(AND); }
{OR}		{ return(OR); }
{NOT}		{ return(NOT); }
{COMM}		{ return(COMM); }
{PNT}		{ return(PNT); }

"\n"
"\t"
" "
.			yyerror();

%%

int yywrap(){
	return 1;
}

int main(int arg, char *argv[]){
	if ( (yyin = fopen(argv[1], "rt")) == NULL ){
		printf("\nNo se puede abrir el archivo %s\n", argv[1]);
		return 1;
	}
	else{
		printf("\nEl archivo %s se abrio correctamente\n", argv[1]);
		yylex();
	}
	printf("\nFLEX finalizo la lectura del archivo %s \n", argv[1]);
	fclose(yyin);
	return 0;
}

int yyerror(void){
	printf("\nError lexico: Caracter invalido: %s, saliendo ...\n", yytext);
	exit(1);
}
