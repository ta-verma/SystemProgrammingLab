%{
	#include<stdio.h>
%}

%%

[a-z] {printf("%c",(yytext[0]-94)%26+97);}
[A-Z] {printf("%c",(yytext[0]-62)%26+65);}

return;

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


