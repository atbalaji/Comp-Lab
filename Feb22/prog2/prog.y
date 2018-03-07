%{

#include<stdio.h>
#include<stdlib.h>
int yylex();
void yyerror(char*);
int fla=0;
%}

%token OR AND WHILE ID LT GT GE LE NE NUM
 
%%

s: e {printf("\nWhile Loop is valid\n"); exit(0);};

e: init  WHILE '(' cond ')' '{' body '}';

init: ID '=' NUM ';';

cond: E AND E
	| E OR E
	| E ;

E:  E LT E
 	| E GT E
	| E LE E
	| E GE E
	| E NE E
	| E LT NUM
	| E GT NUM
	| E LE NUM
	| E GE NUM
	| E NE NUM
	| E AND E
	| E OR E 
	| ID ;

inc: ID '=' ID '+' NUM ';'
	| ID '=' ID '-' NUM ';' ;

body: inc | ;	

%%


void yyerror(char*s)
{
fprintf(stderr,"%s\n",s);
}
int main()
{
yyparse();
return 0;
}
