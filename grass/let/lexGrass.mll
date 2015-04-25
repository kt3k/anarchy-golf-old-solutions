{
(* $Id: lexGrass.mll,v 1.3 2008/09/14 09:45:05 ksk Exp $ *)
open YaccGrass
open Parse
open Lexing
}
let new_line = '\r' '\n' | [ '\r' '\n' ]

rule token = parse
  new_line	{ token (new_line_is_read lexbuf) }
| "Ｗ"+		{ CAPITAL_WS(String.length(lexeme lexbuf)/2) }
| 'W'+		{ CAPITAL_WS(String.length(lexeme lexbuf)) }
| "ｗ"+		{ SMALL_WS(String.length(lexeme lexbuf)/2) }
| 'w'+		{ SMALL_WS(String.length(lexeme lexbuf)) }
| 'v'|"ｖ"	{ SMALL_V }
| eof		{ EOF }
| _		{ token lexbuf }
