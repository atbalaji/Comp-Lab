%{

#include<bits/stdc++.h>
using namespace std;

vector<string> var,key,op,punc;

map<string,int> mp;

string s="nn";
%}

%%

[A-Za-z_][A-Za-z_0-9]* { if(mp[yytext]==1){key.push_back(yytext);yyless(yyleng-1);printf("Printing Keywords without first letter : %s\n",yytext);}else{var.push_back(yytext);}}

"++"|"--" { op.push_back(yytext);}

"+"|"-"|"/"|"*" {op.push_back(yytext);}

"="|">="|">"|"<"|"<="|"<>" {op.push_back(yytext);}

[:;{}()] {punc.push_back(yytext);}

. ;

\n ;

%%
int yywrap(){
if(s=="nn")
{
FILE*fp=fopen("input2.txt","r");
yyin=(FILE*)fp;
s="yes";
return 0;
}
else
{
return 1;
}
}
int main(){
int i,j;
mp["else"]=mp["print"]=mp["if"]=mp["def"]=mp["or"]=mp["return"]=1;
FILE* fp=fopen("input.txt","r");
yyin=(FILE*)fp;
yylex();
cout<<"Identifiers"<<endl;
for(i=0;i<var.size();i++)
cout<<var[i]<<endl;
cout<<endl;
cout<<"Keywords"<<endl;
for(i=0;i<key.size();i++)
{
cout<<key[i]<<endl;
}
cout<<endl;
cout<<"Operators"<<endl;
for(i=0;i<op.size();i++)
{
cout<<op[i]<<endl;
}
cout<<endl;
cout<<"Punctuators"<<endl;
for(i=0;i<punc.size();i++)
cout<<punc[i]<<endl;
return 0;
}
