%{ 
   #include<stdio.h>
   int single_l=0,mul_l=0;
   
%} 


%%
.*\"+.*\"+.* fprintf(yyout,"%s",yytext) ;
"/*"([^\*]|\*[^\/])*"*/"  {mul_l++;	fprintf(yyout,"%s",""); }
[/][/].*  {single_l++; fprintf(yyout,"%s","");}


%% 
  

  
int main() 
{ 
	yyin = fopen("comm.txt","r");
	yyout = fopen("comm_new.txt", "w");
   	yylex();
   	printf("\n\nSingle Line Comments :%d\n Multi-Line Comments:%d\n",single_l,mul_l);	
	return 0; 
} 
int yywrap()
{
	return 1;
}

  
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
             // "/*"[A-Za-z0-9]*"//"*"*/"$ mul_l++;  "//" single_l++;
