%{
#include<bits/stdc++.h>
using namespace std;
string val,val1;
string exp1;
int f;
int count1;
int flag,i;
vector<string> body;
vector<string> vec;
%}

id [_a-zA-Z][_a-zA-Z0-9]*

dig [0-9]+

dec {id}"="{id}"%"{dig}

any (.|\n)*

%%

{dec} { 

	cout<<"switch(";
	cout<<yytext;
	cout<<"){\n";
}

"if("{id}"=="{dig}")"(\n)?"{"{any}"}" {
	count1++;
	printf("\n%s\n",yytext);
	flag=0;
	val="";
	val1="";
	f=0;
	for(i=2;i<yyleng;i++)
	{
		if(yytext[i-1]=='='&&yytext[i-2]=='='){
			flag=1;
	}
		if(yytext[i]=='}')
			f=0;
		if(yytext[i]==')')
			flag=0;
		if(flag)
			val+=yytext[i];
		if(f)
			val1+=yytext[i];
		if(yytext[i]=='{'){
			f=1;
}
	}
	vec.push_back(val);	
	body.push_back(val1);
}

. ;

\n ;

%%
int main()
{
count1=0;
exp1.clear();
flag=0;
body.clear();
yyin=fopen("input.txt","r");
yylex();
for(i=0;i<count1;i++)
{
   cout<<"case "<<val[i]<<":\n";
	cout<<body[i]<<endl;	
	cout<<"break;";
}
return 0;
}

