%{

#include<stdio.h>
#include<stdlib.h>
int yylex();
void yyerror(char*);
int fla=0;
%}

%token FOR ID LT GT GE LE NE NUM
 
%%

s: e ;

e: FOR '(' init ';' cond ';' inc ')' '{' body '}';

init: ID '=' NUM;

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

inc: ID '=' ID '+' NUM
	| ID '=' ID '-' NUM;

body: ;	

%%


void yyerror(char*s)
{
fla=1;
fprintf(stderr,"%s\n",s);
}
int main()
{
yyparse();
if(fla==1)
return 0;
printf("\nFor loop is Valid\n");
return 0;
}
