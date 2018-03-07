%{
#include<bits/stdc++.h>
using namespace std;

string init,cond,inc,body;

//char*a;

int i,j;

%}

id [_a-zA-Z0-9][0-9a-zA-Z_]* 

dig [0-9]+

var {id}"++"

var1 "++"{id}

var2 {id}"--"

var3 "--"{id}

any (.|\n)*

%%

"for("{id}"="{dig}";"{id}("<"|">"|"<="|">=")({id}|{dig})";"({var}|{var1}|{var2}|{var3})")"(\n)?"{"{any}"}" {
	
	for(i=4;yytext[i]!=';';i++)
	{
		init+=yytext[i];
	}	
	init+=";";	
	cout<<init<<endl;
	i+=1;
	for(j=i;yytext[j]!=';';j++)
	{
		cond+=yytext[j];
	}
	j+=1;
	for(i=j;yytext[i]!=')';i++)
	{
		inc+=yytext[i];
	}
	i++;
	for(j=i;yytext[j]!='}';j++)
	{
		body+=yytext[j];	
	}
	cout<<"while(";
	cout<<cond;
	cout<<")";
	cout<<body<<endl;
	inc+=";";
	cout<<inc<<endl;
	cout<<"}"<<endl;
}

{id}"="{dig}";" {init+=yytext;}

"while("{id}("<"|">"|"<="|">=")({id}|{dig})")"(\n)?"{"{any}"}" { 

	for(i=6;yytext[i]!=')';i++)
	{
		cond+=yytext[i];
	}	
	i++;
	for(j=i;j<yyleng-6;j++)
	{		
		body+=yytext[j];
	}
	for(i=j;yytext[i]!=';';i++){
		inc+=yytext[i];
}
body+="\n";
body+="}";

cout<<"for("<<init<<cond<<";"<<inc<<")\n"<<body<<endl;
}
. ;

%%

int main(){
init.clear();
cond.clear();
inc.clear();
body.clear();

yylex();
return 0;
}
