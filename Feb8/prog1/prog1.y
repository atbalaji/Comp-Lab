%{

#include<stdio.h>
#include<stdlib.h>
int yylex(void);

void yyerror(char*);
%}

%token INTEGER

%%

prog: prog expr '\n'	{printf("%d\n",$2);}
	| ;

expr: INTEGER     { $$ = $1;}
      | expr '+' expr  { $$ = $1 + $3;}
      | expr '-' expr  { $$ = $1 - $3;}
      | expr '*' expr  { $$ = $1 * $3;}
      | expr '	      ;

%%

void yyerror(char*s){

fprintf(stderr, "%s\n",s);
//return 0;
}

int main(){

yyparse();
return 0;
}					
