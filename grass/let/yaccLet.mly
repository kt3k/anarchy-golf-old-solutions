/* $Id: yaccLet.mly,v 1.3 2008/09/14 09:54:09 ksk Exp $ */
%{
open Parse
open Let
%}
%token EOF
%token LET EQ IN LPAREN RPAREN SEMICOLON
%token SUCC GETC PUTC W
%token <string>VAR

/* precedence */
/* low */
/* high */

%start entry
%type <string Let.exp> entry
%%
entry:
| exp EOF
{ $1 }

exp:
| single
{ [$1] }
| single exp
{ $1::$2 }

single:
| LET var args EQ body
{ { name=$2; bind=$3; body=$5 } }

args:
|
{ [] }
| var args
{ $1::$2 }

body:
| LET var EQ app IN body
{ let (abind,abody) = $6 in (($2,$4)::abind, abody) }
| app SEMICOLON body
{ let (abind,abody) = $3 in (("_",$1)::abind, abody) }
| app
{ ([], $1) }

app:
| LPAREN app RPAREN
{ $2 }
| var
{ LVar $1 }
| app appR
{ LApp($1,$2) }

appR:
| LPAREN app RPAREN
{ $2 }
| var
{ LVar $1 }

var:
| VAR
{ $1 }
| SUCC
{ strSucc }
| PUTC
{ strPutc }
| GETC
{ strGetc }
| W
{ strW }

