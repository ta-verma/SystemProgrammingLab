%{ 
   #include<stdio.h>
   int keywords=0,op=0,id=0,integers=0,com=0,fl=0;
%} 
KNOSTAR [^*]* 
PSTAR \*+ 
NOSTARSLASH [^*/]
DIGIT [0-9]
LETTER [A-Za-z]
KEY int|char|bool|float|void|for|do|while|if|else|return|void
FLOAT [0-9]+(\.)[0-9]+

%%

\"((\\\")|[^"])*\"
"/*"{KNOSTAR}{PSTAR}({NOSTARSLASH}{KNOSTAR}{PSTAR})*"/" {com++;}
"//".* {com++;}

{KEY} {keywords++;}


'#'[a-zA-Z0-9]*    {;}

[_a-zA-Z]+[a-zA-Z0-9_]* {id++;}



\+?\-?{FLOAT}  {fl++;}  	
\+?\-?{DIGIT}+ {integers++;}

(<|>|<=|>=|==|=|\+|\-) {op++;}
.        {;}

%%
int main()
{
	yyin = fopen("comm.txt","r");
 	yylex();
 	printf("Keywords :%d\nOperators :%d\nIdentifier :%d\nComments :%d\nIntegers :%d\nFloats :%d\n",keywords,op,id,com,integers,fl);
 	return 0;
}
int yywrap()
{
	return 1;
}
