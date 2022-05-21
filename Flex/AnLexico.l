%{
/*
	PALABRAS RESERVADAS
*/
%}

INTt	num
RELt	real
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

%{
/*
	VARIABLES
*/
%}

ID		[a-z|A-Z]([a-z|A-Z]+|[\d]+)+
BOL		[0|1]
INT		[0-9]+
REL		((\+|-)?([0-9]+)(\.[0-9]+)?)|((\+|-)?\.?[0-9]+)
CAR		[a-z|A-Z]
CAD		([a-z|A-Z]*)

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
COMM	(\#)
PNT		(\.)

%%

{INTt}		printf("\nINTt:%s\n",yytext);
{RELt}		printf("\nRELt:%s\n",yytext);
{BOLt}		printf("\nBOLt:%s\n",yytext);
{CARt}		printf("\nCARt:%s\n",yytext);
{CADt}		printf("\nCADt:%s\n",yytext);
{LST}		printf("\nLST:%s\n",yytext);
{SIS}		printf("\nSIS:%s\n",yytext);
{SIN}		printf("\nSIN:%s\n",yytext);
{MNTS}		printf("\nMNTS:%s\n",yytext);
{HAZ}		printf("\nHAZ:%s\n",yytext);
{DSD}		printf("\nDSD:%s\n",yytext);
{HST}		printf("\nHST:%s\n",yytext);
{MSTR}		printf("\nMSTR:%s\n",yytext);
{LEE}		printf("\nLEE:%s\n",yytext);
{GRP}		printf("\nGRP:%s\n",yytext);
{NULL}		printf("\nNULL:%s\n",yytext);

{ID}		printf("\nID:%s\n",yytext);
{INT}		printf("\nINT:%s\n",yytext);
{REL}		printf("\nREL:%s\n",yytext);
{BOL}		printf("\nBOL:%s\n",yytext);
{CAR}		printf("\nCAR:%s\n",yytext);
{CAD}		printf("\nCAD:%s\n",yytext);

{MAS}		printf("\nMAS:%s\n",yytext);
{MNS}		printf("\nMNS:%s\n",yytext);
{MLT}		printf("\nMLT:%s\n",yytext);
{DIV}		printf("\nDIV:%s\n",yytext);
{RES}		printf("\nRES:%s\n",yytext);
{POT}		printf("\nPOT:%s\n",yytext);
{MNR}		printf("\nMNR:%s\n",yytext);
{MNG}		printf("\nMNG:%s\n",yytext);
{MYR}		printf("\nMYR:%s\n",yytext);
{MYG}		printf("\nMYG:%s\n",yytext);
{CMP}		printf("\nCMP:%s\n",yytext);
{DIF}		printf("\nDIF:%s\n",yytext);
{ASG}		printf("\nASG:%s\n",yytext);
{PYC}		printf("\nPYC:%s\n",yytext);
{ABRP}		printf("\nABRP:%s\n",yytext);
{CIEP}		printf("\nCIEP:%s\n",yytext);
{ABLL}		printf("\nABLL:%s\n",yytext);
{CILL}		printf("\nCILL:%s\n",yytext);
{ABRC}		printf("\nABRC:%s\n",yytext);
{CIEC}		printf("\nCIEC:%s\n",yytext);
{COMA}		printf("\nCOMA:%s\n",yytext);
{AND}		printf("\nAND:%s\n",yytext);
{OR}		printf("\nOR:%s\n",yytext);
{NOT}		printf("\nNOT:%s\n",yytext);
{COMM}		printf("\nCOMM:%s\n",yytext);
{PNT}		printf("\nPNT:%s\n",yytext);

%%

int yywrap(){
	return 1;
}

int main(void){
	yylex();
}