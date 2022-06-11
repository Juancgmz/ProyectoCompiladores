%{
#include<studio.h>
int yylex();
void yyerror(char * s);
int yyparse();
%}

%union {
	float real;
	boolean bool;
	char* car;
	int num;
}

%token <num> INTt
%token <real> RELt
%token <bool> BOLt
%token <car> CARt
%token CADt LST SIS SIN MNTS HAZ DSD HST MSTR LEE GRP
%token <null> NULL

%token MAS MNS MLT DIV RES POT MNR MNG MYR MYG CMP DIF ASG PYC ABRP CIEP ABLL CILL ABRC CIEC COMA AND OR NOT COMM PNT PRM

%left MAS MNS
%left MLT DIV

%type pgrm gvars vars ids idx funciones main parametrosd estatutos estatuto asgncn lcrt scrt loop cndcn excep fncn parametrosa cond comp exprsn exp ex ida valor whiles fors tipo agrega veces

%start PGRM

%%
pgrm	: PRM ID PYC gvars funciones main;
gvars	: VRS vars;
vars	: tipo ids PYC vars
	| FVRS;
ids	: idx COMA ids
	| idx;
idx	: LST ID ABRC INT CIEC
	| ID ABLL parametrosd CILL
	| ID;
funciones: tipo ID ABRP parametrosd CIEP vars ABLL estatutos| /*EMPTY*/;
main: MNF ABRP CIEP ABLL estatutos CILL;
parametrosd: tipo ID COMA parametrosd
	| tipo ID 
	| /*EMPTY*/;
estatutos: estatuto estatutos
	| /*EMPTY*/;
estatuto: ASGNCN
	| lcrt
	| scrt
	| loop
	| cndcn
	| fncn|  /*EMPTY*/;
asgncn 	: ID ASG exprsn PYC;
lcrt	: LEE ABRP exprsn CIEP PYC;
scrt	: MSTR ABRP exprsn CIEP PYC;
loop	: whiles
	| fors;
cndcn	: SIS ABRP cond CIEP ABLL estaturos CILL excep;
excep	: SIN ABLL estatutos CILL
	| /*EMPTY*/;
fncn	: ID ABRP parametrosa CIEP PYC
parametrosa: exprsn parametrosa
	| exprsn| /*EMPTY*/;
cond	: exprsn comp exprsn
	| TRUE
	| FALSE;
comp: MNR
	| MNG
	| MYR
	| MYG
	| CMP
	| DIF;
exprsn	: exp agrega exprsn
	| exp;
exp	:ex veces exp
	| ex
ex	: ida
	| fncn
	| valor
	| ABRP exprsn CIEP;
ida	: ID ABRC INT CIEC
	| ID PNT ID
	| ID;
valor	: CAR
	| CAD
	| INT
	| REL
	| BOL;
while	: MNTS ABRO cond CIEP ABLL estatuos CILL;
fors	: DSD exprsn HASTA exprsn ABLL estatutos CILL;
tipo	:INTt
	|CARt
	|CADt
	|RELt
	|GRP
	|LST;
agrega	:MAS | MNS;
veces 	:MLT | DIV;
