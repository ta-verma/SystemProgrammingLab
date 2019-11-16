%{

 #include <stdio.h>
 #include <stdlib.h>

%}
%token ID NUM 
%left '='
%left '-''+'
%left '*' '/'


%%


S      :  Expr {printf("Correct "); exit(0);}
       ;
Expr   : Expr '+' Expr 
       | Expr '-' Expr      
       | Expr '*' Expr
       | Expr '/' Expr
       | '(' Expr ')'
       | ID 
       | Expr '=' Expr
       | NUM
%%


int yyerror(char*s)
{
    printf("%s \n",s);
    exit(0);
}


int main()
{   
    yyparse();
    return 0;
}
