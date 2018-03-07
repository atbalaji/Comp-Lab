%%

[a-zA-Z0-9]*(ab)+[a-zA-Z0-9]* {printf("\nMatched ab concatenated : %s\n",yytext);}

\n ;

. ;

%%

int main()
{
printf("\nMatched Patterns\n");
yylex();
}
