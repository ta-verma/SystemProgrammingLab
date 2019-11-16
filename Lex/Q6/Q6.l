%{
	#include<stdio.h>
	int words=0,chr=0,b_space,lines=0;
%}

%%
[ ] b_space++;
[\n] lines++; 
. chr++;
%%


int main() 
{ 
	yyin = fopen("Program.txt","r");
   	yylex();
   	words=b_space+lines+1;
   	lines++;
   	if(chr==0) {lines=0;words=0;}
   	chr=chr+b_space;
   	printf("\n\nBlank Space :%d\nLines:%d\nCharacters :%d\nWords :%d\n",b_space,lines,chr,words);	
	return 0; 
} 
int yywrap()
{
	return 1;
}

  
