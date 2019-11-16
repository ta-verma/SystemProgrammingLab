%{
      #include <stdio.h>
      #include <stdlib.h>     
%}

%token DIGIT NEWLINE
%left '-' '+'
%left '*' '/'
%left '%' 
%%

start : expr NEWLINE  {                       
                            printf("Result = %d",$1);  
                            printf("\nComplete\n");
                            exit(1);
                        
                      }                    
  ;

expr: | expr '+' expr  {$$=$1+$3;}
  | expr '-' expr     {$$=$1-$3;}
  | expr '*' expr     {$$=$1*$3;}
  | expr '/' expr     { if($3==0) {yyerror("divide by zero error :  ");}    $$=$1/$3;}
  | expr '%' expr     {$$=$1%$3;}
  |'(' expr ')'       {$$=$2;}
  | DIGIT             {}
  
  ;

%%

int yyerror(char const *s)
{
    printf("%s\n ",s);
        exit(1);
}
int main()
{
  yyparse();
  return 1;
}
