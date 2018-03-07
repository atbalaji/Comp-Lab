%{
	#include<bits/stdc++.h>
	using namespace std;
	int count1,i;
	int c;
	string cond1,cond2,id1,id2,inc1,inc2,stat1,stat2;
%}

op "<"|">"|"<="|">="|"!="|"=="
cond [a-zA-Z]+{op}[0-9]+
id [_a-zA-Z0-9][0-9a-zA-Z_]*
dig [0-9]+


%%

{id}"="{dig} {
		if(count1==0)
			id1=yytext;
		else
			id2=yytext;
}

{id}"++"; {
	c++;
	//cout<<"ah";
	if(c==1)
	{
	//yyless(1);
		inc2=yytext;
	}
	else if(c==2)
	{
//	yyless(1);
		inc1=yytext;
}
}

. {
	if(count1==2)
	{
		if(yytext[0]=='}')
		count1==0;
		else if(yytext[0]!='{')
		stat2+=yytext[0];
	}
}

"while("{cond}")" {
	count1++;	
	//cout<<count1<<endl;
	if(count1==1)
		{
			for(i=6;yytext[i]!=')';i++)
			{
				cond1+=yytext[i];
			}	
		}
	else if(count1==2){
			for(i=6;yytext[i]!=')';i++)
			{
				cond2+=yytext[i];
			}
}
}

\n ;
%%

int main()
{
count1=0;
c=0;
yylex();
string in1,in2;
for(i=0;i<inc1.size()-1;i++)
in1+=inc1[i];
for(i=0;i<inc2.size()-1;i++)
in2+=inc2[i];
cout<<"for("<<id1<<";"<<cond1<<";"<<in1<<")"<<endl;
cout<<"\n{";
cout<<"for("<<id2<<";"<<cond2<<";"<<in2<<")"<<endl;
cout<<"\n{";
cout<<endl<<stat2<<endl;
cout<<"}";
cout<<"\n}\n";
return 0;
}
