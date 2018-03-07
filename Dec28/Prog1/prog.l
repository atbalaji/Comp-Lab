%{
#include "bits/stdc++.h"
#include <string.h>
#include <fcntl.h>
using namespace std;
int upper=0,lower=0,cons=0,strings=0;
%}

%%

[a-z] {lower++;}

[A-Z] {upper++;}

[a-z]+ {printf("\nString Found : %s\n",yytext);strings++;}

[0-9]+ {printf("\nConstant Found : %s\n",yytext);cons++;}

. ;

\n ;

%%

int main(int argc,char*argv[])
{
int i;
for(i=1;i<argc;i++)
{
printf("\n\nFile Opened.......... %s\n\n",argv[i]);
FILE* fp=fopen(argv[i],"r");
yyin=(FILE*)fp;
upper=lower=strings=cons=0;
yylex();
printf("\nUpper count : %d",upper);
printf("\nLower count : %d",lower);
printf("\nstrings count : %d",strings);
printf("\nConstant Count : %d\n",cons);
}
return 0;
}
