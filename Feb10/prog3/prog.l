%{
#include<bits/stdc++.h>
using namespace std;

string s;
%}


line \n

%%

"#define "[a-zA-Z]+"("[a-zA-Z]+","[a-zA-Z]+") "([a-zA-Z0-9+-])*   { printf("\nThe macro is \n%s\n\n",yytext);s=yytext;}
	
. ;

\n ;
	

%%
int main()
{
	yylex();
	int i;
string body,head,param1,param2;
	int c=0,cou=0;
	for(i=0;i<s.size();i++)
	{	
		if(s[i]==' ')c++;
		if(c==1)
		{
			if(cou==0)
			head+=s[i];
			if(s[i]=='('||s[i]==')'){cou=1;continue;}
			if(s[i]==','){cou++;continue;}
			if(cou==1)
			param1+=s[i];
			if(cou==2)
			param2+=s[i];
			}
		if(c==2)
			body+=s[i];
}
body="return "+body;
body+=";";

head+="int ";
head+=param1;
head+=",";
head+="int ";
head+=param2;
head+=")";
//	cout<<head<<" "<<body<<endl;
	cout<<endl;
	cout<<"int"<<" "<<head<<"{"<<endl;
	cout<<body<<endl;
	cout<<"}";
	cout<<endl;
	return 0;
}
