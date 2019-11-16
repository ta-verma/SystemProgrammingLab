%{
	#include<stdio.h>
	int len;
%}

%%
[A-Za-z]+ 	{
				len=yyleng;
				while(len)
				{	int i=0;
					while(i<len)
					{
						printf("%c",yytext[i]);
						++i;
					}
					printf("\n");
					len--;
				} 
			}

%%

int main()
{
	yylex();
	return 0;
}

int yywrap()
{
	return 1;
}

