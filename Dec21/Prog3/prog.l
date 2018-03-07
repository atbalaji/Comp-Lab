%%

[a-z] ;


[a-zA-Z]*([+-])?[0-9]+[a-zA-Z]* {printf("Matched for numbers : %s\n",yytext);}

\n ;

. ;

%%

int main()
{
yylex();
return 0;
}
