%%
(([a-zA-Z]_)|([0-9]))+ {ECHO; printf("\n");} 
. ;
\n ;
%%


int main()
{
yylex();
return 0;
}
