%{
	#include<bits/stdc++.h>
	using namespace std;
	int i,c1,c2,flag;
	string cond1,cond2,cond3,cond4,stat1,stat2,stat3,stat4;
%}

op "<"|">"|"<="|">="|"!="|"=="
cond [a-zA-Z]+{op}[0-9]+
id [_a-zA-Z0-9][0-9a-zA-Z_]*
dig [0-9]+


%%

"else" {
	flag=1;
}

"if("{cond}")" {
	if(flag==0)
	{
		c1++;
		if(c1==1)
		{
		for(i=3;yytext[i]!=')';i++){
			cond1+=yytext[i];
		}
		}
		else{
			for(i=3;yytext[i]!=')';i++){
			cond2+=yytext[i];
		}
		}
	}
	else{
		  c2++;
                if(c2==1)
                {
                for(i=3;yytext[i]!=')';i++){
                        cond3+=yytext[i];
                }
                }
                else{
                        for(i=3;yytext[i]!=')';i++){
                        cond4+=yytext[i];
                }
                }

}
}
\n ;
. {
	if(flag==0&&c1==1)
	{
		if(yytext[0]!='{'&&yytext[0]!='}')
		stat1+=yytext;
	}
	else if(flag==0&&c1==2)
	{
		if(yytext[0]!='{'&&yytext[0]!='}')
		stat2+=yytext;
	}
	 else if(flag==1&&c2==1)
        {
                if(yytext[0]!='{'&&yytext[0]!='}')
                stat3+=yytext;
        }
	 else if(flag==1&&c2==2)
        {
                if(yytext[0]!='{'&&yytext[0]!='}')
                stat4+=yytext;
        }


}
%%

int main()
{
c1=0;
c2=0;
flag=0;
yylex();
cout<<"\nif("<<cond1<<"&&"<<cond2<<")\n{\n";
cout<<stat2<<endl;
cout<<"}\n";
cout<<"else ";
cout<<"if("<<cond3<<"&&"<<cond4<<")\n{\n";
cout<<stat4<<endl;
cout<<"}\n";
return 0;
}
