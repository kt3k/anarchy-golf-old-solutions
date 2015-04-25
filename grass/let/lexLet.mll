{
(* $Id: lexLet.mll,v 1.4 2008/09/14 07:58:01 ksk Exp $ *)
open YaccLet
open Parse
open Lexing
}
let space = [ ' ' '\t' ]*
let new_line = '\r' '\n' | [ '\r' '\n' ]

let string = ['a'-'z' 'A'-'Z' '_' '0'-'9']*
rule token = parse
  space		{ token lexbuf }
| new_line	{ token (new_line_is_read lexbuf) }
| eof		{ EOF }
| "(*"		{ comment lexbuf }
| "//"		{ line_comment lexbuf }
| "let"		{ LET }
| '='		{ EQ }
| "in"		{ IN }
| '('		{ LPAREN }
| ')'		{ RPAREN }
| ';'		{ SEMICOLON }
| "Succ"	{ SUCC }
| "Putc"| "Out"	{ PUTC }
| "Getc"| "In"	{ GETC }
| "W"		{ W }
| string	{ VAR(lexeme lexbuf) }
| _		{ raise Lexing_error }

and comment = parse
| "*)"			{ token lexbuf }
| new_line		{ comment (new_line_is_read lexbuf) }
| _			{ comment lexbuf }

and line_comment = parse
| new_line		{ token (new_line_is_read lexbuf) }
| _			{ line_comment lexbuf }

