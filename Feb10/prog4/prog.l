%{
#include<bits/stdc++.h>
using namespace std;
string fun,macname,para,body;
int flag=0;
%}

%%

.* { fun=yytext; cout<<fun<<endl;}


%%

int main()
{
fun.clear();
macname.clear();
para.clear();
body.clear();
yylex();
flag=0;
int i;
int p=0;
for(i=0;i<fun.size();i++)
{
if(fun[i]==" "&&bo==0)
flag=1;
if(fun[i]=="(")
{
flag=0;
p=1;
}
if(p==1)
{
para+=fun[i];
}
if(fun[i]==")")
{
p=0;
}
if(fun[i]=="{")
bo=1;
if(flag==1)
macname+=fun[i];
}
cout<<"#define "<<macname<<"(";
return 0;
}
