%{  
    #include <stdio.h>
    #include "y.tab.h"
%}


id   [a-z][0-9] 
num  [0-9]+(\.[0-9]+)?

%%


{id}        return ID;
{num}       return NUM;
{num}"="    {   yyerror("Error"); }
.           return *yytext;


%%


int yywrap()
{
    return 1;
}