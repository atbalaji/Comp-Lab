%{

#include<stdio.h>
#include<stdlib.h>
int yylex();
void yyerror(char*);
int fla=0;
%}

%token WHILE ID LT GT GE LE NE NUM
 
%%

s: e {printf("\nWhile Loop is valid\n"); exit(0);};

e: init  WHILE '(' cond ')' '{' body '}';

init: ID '=' NUM ';';

cond:  ID LT ID
 	| ID GT ID
	| ID LE ID
	| ID GE ID
	| ID NE ID
	| ID LT NUM
	| ID GT NUM
	| ID LE NUM
	| ID GE NUM
	| ID NE NUM ;

inc: ID '=' ID '+' NUM ';'
	| ID '=' ID '-' NUM ';' ;

body: inc e | inc | ;	

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
