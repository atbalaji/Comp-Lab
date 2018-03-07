%{
#include "bits/stdc++.h"
#include <string.h>
#include <fcntl.h>
using namespace std;

map<string,int> mp;
int spcount=0,key=0,idcount=0,numcount=0,delimiter=0,assign=0,op=0,relopcount=0;
%}

%%

[a-zA-Z_][a-zA-Z0-9_]* {if(mp[yytext]==1){printf("\nKeyword found :%s\n",yytext);key++;}else{printf("\nId found : %s\n",yytext);idcount++;}}

[0-9][0-9]*("."[0-9][0-9]*([Ee][+-][0-9]+)?)? {printf("\n Num found : %s\n",yytext);numcount++;}

([!@#$%^&]|\(\)) { printf("Special Character found: %s\n",yytext);spcount++;}

[ \n\t] {delimiter++;}

(<>)|(>=)|(<=)|>|<|= {printf("Relational Operator Found : %s\n",yytext);relopcount++;}

. {if(strcmp(yytext,"=")==0){
	assign++;}
   if((strcmp(yytext,"*")==0)||(strcmp(yytext,"/")==0)||(strcmp(yytext,"+")==0)||(strcmp(yytext,"-")==0)){
		op++;	
	}
  }

%%

int main(int argc,char*argv[])
{
mp["int"]=mp["for"]=mp["do"]=mp["while"]=mp["char"]=mp["float"]=mp["this"]=mp["double"]=mp["struct"]=mp["class"]=mp["map"]=mp["vector"]=mp["long"]=mp["return"]=mp["switch"]=mp["else"]=mp["if"]=mp["continue"]=mp["break"]=mp["string"]=mp["unsigned"]=mp["real"]=mp["public"]=mp["protected"]=mp["const"]=mp["define"]=1;
int i;
for(i=1;i<argc;i++)
{
printf("\n\nFile Opened.......... %s\n\n",argv[i]);
FILE* fp=fopen(argv[i],"r");
yyin=(FILE*)fp;
idcount=numcount=delimiter=assign=op=key=spcount=relopcount=0;
yylex();
printf("\nIdentifier count : %d",idcount);
printf("\nNumber count : %d",numcount);
printf("\nDelimiter count : %d",delimiter);
printf("\nAssign Count : %d",assign);
printf("\nOperator Count : %d",op);
printf("\nKeyword Count : %d\n",key);
printf("\nSpecial Characters Count : %d\n",spcount);
printf("\nRelational Operators Count : %d\n",relopcount);
}
return 0;
}
