%%

[a-zA-Z0-9]*(abc)[a-zA-Z0-9]* {printf("\nabc Matched : %s\n",yytext);}


[a-zA-Z0-9]*[a-z][a-zA-Z0-9]* {printf("\nMatched Lowercase letter : %s\n",yytext);}

[a-zA-Z0-9]*[A-Z][a-zA-Z0-9]* {printf("\nMatched Uppercase letter : %s\n",yytext);}


^d[a-zA-Z0-9]*t$ {printf("\nStarting With d and ending with t : %s\n",yytext);}

\n ;

. ;

%%

int main()
{
printf("\nMatched Patterns");
yylex();
return 0;
}
