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
PRM		programa

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

{INTt}		{ return(INTt); }
{RELt}		{ return(RELt); }
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

{ID}		{ return(ID); }
{INT}		{ return(INT); }
{REL}		{ return(REL); }
{BOL}		{ return(BOL); }
{CAR}		{ return(CAR); }
{CAD}		{ return(CAD); }

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

%%

int yywrap(){
	return 1;
}

int main(void){
	yylex();
}