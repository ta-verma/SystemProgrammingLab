%{
#include<string.h>
int size=0;
char ch[50];
%}

%%

[a-zA-Z]+ 	{ if(yyleng > size)
					{
						size=yyleng;
						strcpy(ch,yytext);
						
					}
				}
\n   return;

%%


int main()
{
 yylex(); 
 printf("longest: %s",ch);
 return 0;
}
int yywrap()
{
	return 1;
}
