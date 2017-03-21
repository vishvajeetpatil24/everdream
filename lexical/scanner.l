/*The Smaple Lex file Created to tokenize the Hello World Program*/
/*("#include <")({LETTER}|{DIGIT})+"."({LETTER}|{DIGIT})+">"  {printf("<HEADER>\n");}*/

letter [_a-zA-Z]
digit [0-9]
punct [,.:;!?]
nonblank [^ \t]
whitespace [ \t]
operator [+-/*<>]
single [&|]
brace [(){}]
symb [#]
%{
	#include <stdio.h>
	FILE *fp;
%}

%%
"int"|"float"|"double"          {printf("<Keyword> ");}
{letter}({letter}|{digit})*		{printf("<Identifier> ");}
{digit}+                        {printf("<digits> ");}
\".*?\"                           {printf("<string> ");}
{brace}                         {printf("<Brace> ");}
;                                {printf("<Semicolon> ");}
\n                               {printf("\n");}
"."                             {printf("<dot> ");}
{symb}                          {printf("symbol");}
%%

int main(int argc,char *argv[])
{
	FILE *fh;
	FILE *fh1;
    if (argc == 2 && (fh = fopen(argv[1], "r")) && (fh1 = fopen("out.txt","w+")))
    {    
        yyin = fh;
        //yyout = fh1;
    }
    //yyin = fopen(argv[1], "r");
	yylex();
	return 0;
}