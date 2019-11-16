%{
	#include<stdio.h>
	int chr=0,lines=0,words;
%}

%%
[\n] lines++; 
. chr++;
%%


int main() 
{ 
	yyin = fopen("Program.txt","r");
   	yylex();
   	if(chr==0) {lines=0;words=0;}
   	printf("\nLines:%d\nCharacters :%d",lines,chr);	
	return 0; 
} 
int yywrap()
{
	return 1;
}

  
