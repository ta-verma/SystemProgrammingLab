%{
    #include <stdlib.h>
    #include <stdio.h>

%}
%token A  B NL


%%
S           : A A A A A A A A A A S1 B NL {printf("Accepted \n"); exit(1);}

S1          : A S
			| A
            ;
          
%%


int main()
{
    yyparse();
    return 0;
}


int yyerror()
{
    printf("Invalid");
    exit(1);
}