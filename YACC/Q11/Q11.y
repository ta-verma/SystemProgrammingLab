%{
    #include <stdio.h>
    #include <stdlib.h>
%}

%token A B NL

%%
S :  S1 NL {printf("Accepted ! \n"); exit(1);}

S1 :   	A S1 B 
     	| A B 
        ;
%%
int main()
{   yyparse();
    return 0;
}
int yyerror()
{
    printf("Invalid ");
    exit(1);
}