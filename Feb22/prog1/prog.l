%{
#include<stdio.h>
#include<stdlib.h>
void yyerror(char*);
#include "y.tab.h"
%}


%%

"for" { yylval=*yytext;return FOR; }

"(" {  return *yytext; }

")" {   return *yytext; }

";" {   return *yytext; }

[_a-zA-Z][a-zA-Z0-9]* {  yylval=*yytext; return ID; }

"{" { return *yytext; }

"}" { return *yytext; }

"<" { yylval=*yytext;return LT; }

">" { yylval=*yytext; return GT; }

">=" { yylval=*yytext;return GE; }

"<=" { yylval=*yytext;return LE; }

"!=" { yylval=*yytext;return NE; }

"+" { return *yytext; }

"-" { return *yytext; }

"=" { return *yytext; }

[0-9]+ { yylval = atoi(yytext); return NUM; }

[ \t\n] ;

.  ;
%%

int yywrap(){
return 1;
}

