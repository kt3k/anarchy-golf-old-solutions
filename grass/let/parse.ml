(* $Id: parse.ml,v 1.4 2008/09/13 18:58:32 ksk Exp $ *)
(* common function for parsing *)

open Format
open Print
open Lexing
open Parsing
exception Lexing_error
exception Parsing_error

let pp_position fmt pos = pp_record [
  pp_field "pos_fname" pp_string pos.pos_fname;
  pp_field "pos_lnum" pp_int pos.pos_lnum;
  pp_field "pos_bol" pp_int pos.pos_bol;
  pp_field "pos_cnum" pp_int pos.pos_cnum;
] fmt

let pp_parsing_status fmt rhs_nth =
  fprintf fmt "symbol_start = @[%a@]@." pp_int (symbol_start());
  fprintf fmt "symbol_end = @[%a@]@." pp_int (symbol_end());
  fprintf fmt "rhs_start = @[%a@]@." pp_int (rhs_start rhs_nth);
  fprintf fmt "rhs_end = @[%a@]@." pp_int (rhs_end rhs_nth);
  fprintf fmt "symbol_start_pos = @;  @[%a@]@." pp_position (symbol_start_pos());
  fprintf fmt "symbol_end_pos = @;  @[%a@]@." pp_position (symbol_end_pos());
  fprintf fmt "rhs_start_pos = @;  @[%a@]@." pp_position (rhs_start_pos rhs_nth);
  fprintf fmt "rhs_end_pos = @;  @[%a@]@." pp_position (rhs_end_pos rhs_nth)

let new_line_is_read lexbuf =
  lexbuf.lex_curr_p <- { lexbuf.lex_curr_p with
                           pos_lnum = succ lexbuf.lex_curr_p.pos_lnum;
                           pos_bol = lexbuf.lex_curr_p.pos_cnum };
  lexbuf


let pp_error fmt message lexbuf =
  let start_pos = lexeme_start_p lexbuf
  and end_pos = lexeme_end_p lexbuf in
  let fname = start_pos.pos_fname in
  fprintf fmt "Syntax error: %s@." message;
  if fname = "" then
    fprintf fmt "Characters %d-%d.@."
      start_pos.pos_cnum end_pos.pos_cnum
  else
    fprintf fmt "File %S, line %d, characters %d-%d.@."
      fname start_pos.pos_lnum (start_pos.pos_cnum - start_pos.pos_bol)
      (end_pos.pos_cnum - start_pos.pos_bol)
(*   pp_parsing_status fmt 1 *)
  
let parse_lexbuf ~yacc ~lex lexbuf =
  try yacc lex lexbuf
  with
    | Parse_error ->
        let message = sprintf "At or near %S." (lexeme lexbuf) in
        pp_error err_formatter message lexbuf;
        raise Parsing_error
    | Lexing_error ->
        let message = sprintf "Unrecognized character %S." (lexeme lexbuf) in
        pp_error err_formatter message lexbuf;
        raise Lexing_error

let parse_string ~yacc ~lex str =
  let lexbuf = from_string str in
  parse_lexbuf ~yacc ~lex lexbuf

let parse_file ~yacc ~lex name =
  let ic = open_in name in
  let lexbuf = from_channel ic in
  lexbuf.lex_curr_p <- { lexbuf.lex_curr_p with pos_fname = name };
  let t = parse_lexbuf ~yacc ~lex lexbuf in
  close_in ic;
  t

let unquote str = String.sub str 1 (String.length str-2)

