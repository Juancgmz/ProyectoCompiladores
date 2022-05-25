%{
#include<studio.h>
int yylex();
void yyerror(char * s);
int yyparse();
%}


%union

{
float real;
boolean bool;
char * car;
null null;
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

%type PGRM GVARS VARS IDS IDX FUNCIONES MAIN PARAMETROSD ESTATUTOS ESTATUTO ASGNCN LCTR SCRT LOOP CNDCN EXCEP FNCN PARAMETROSA COND COMP EXPRSN EXP EX IDA VALOR WHILES FORS TIPO 

%start PGRM

%%
PGRM 	: PRM ID PYC GVARS FUNCIONES MAIN;
GVARS 	: VRS VARS;
VARS 	: TIPO IDS PYC VARS
	| FVRS;
IDS 	: IDX COMA IDS
	| IDX;
IDX 	: LST ID ABRC INT CIEC
	| ID ABLL PARAMETROSD CILL
	| ID;
FUNCIONES : TIPO ID ABRP PARAMETROSD CIEP VARS ABLL ESTATUTOS | /*EMPTY*/;
MAIN : MNF ABRP CIEP ABLL ESTATUTOS CILL;
PARAMETROSD : TIPO ID COMA PARAMETROSD
	| TIPO ID 
	| /*EMPTY*/;
ESTATUTOS : ESTATUTO ESTATUTOS
	| /*EMPTY*/;
ESTATUTO : ASGNCN
	| LCTR
	| SCRT 
	| LOOP
	| CNDCN
	| FNCN |  /*EMPTY*/;
ASGNCN 	: ID ASG EXPRSN PYC;
LCRT 	: LEE ABRP EXPRSN CIEP PYC;
SCRT 	: MSTR ABRP EXPRSN CIEP PYC;
LOOP 	: WHILES
	| FORS;
CNDCN 	: SIS ABRP COND CIEP ABLL ESTATUTOS CILL EXCEP;
EXCEP 	: SIN ABLL ESTATUTOS CILL
	| /*EMPTY*/;
FNCN  	: ID ABRP PARAMETROSA CIEP PYC
PARAMETROSA : EXPRSN PARAMETROSA
	| EXPRSN | /*EMPTY*/;
COND 	: EXPRSN COMP EXPRSN
	| TRUE
	| FALSE;
COMP	: MNR
	| MNG
	| MYR
	| MYG
	| CMP
	| DIF;
EXPRSN 	: EXP AGREGA EXPRSN
	| EXP;
EXP	:EX VECES EXP
	| EX
EX	: IDA
	| FNCN
	| VALOR
	| ABRP EXPRSN CIEP;
IDA	: ID ABRC INT CIEC
	| ID PNT ID
	| ID;
VALOR	: CAR
	| CAD
	| INT
	| REL
	| BOL;
WHILE 	: MNTS ABRO COND CIEP ABLL ESTATUTOS CILL;
FORS	: POR ABRP EXPRSN HASTA EXPRSN CIEP ABLL ESTATUTOS CILL;
TIPO	:INTt
	|CARt
	|CADt
	|RELt
	|GRP
	|LST;

	
