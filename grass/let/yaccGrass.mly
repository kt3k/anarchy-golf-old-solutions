/* $Id: yaccGrass.mly,v 1.2 2008/09/13 12:58:44 ksk Exp $ */
%{
open Common
open Parse
open Grass
%}
%token EOF SMALL_V
%token <int>CAPITAL_WS SMALL_WS

/* precedence */
/* low */
/* high */

%start entry
%type <Grass.code> entry
%%
entry:
| code EOF
{ $1 }

code:
| inst 
{ $1 }
| inst SMALL_V code
{ $1@$3 }

inst:
| apps
{ fargs2code $1 }
| small_ws apps
{ [Abs($1,$2)] }

apps:
| 
{ [] }
| app apps
{ $1::$2 }

app:
| capital_ws small_ws
{ {f=$1;arg=$2} }

capital_ws:
| CAPITAL_WS
{ $1 }
| CAPITAL_WS capital_ws
{ $1+$2 }

small_ws:
| SMALL_WS
{ $1 }
| SMALL_WS small_ws
{ $1+$2 }
