type token =
  | EOF
  | SMALL_V
  | CAPITAL_WS of (int)
  | SMALL_WS of (int)

open Parsing;;
# 3 "yaccGrass.mly"
open Common
open Parse
open Grass
# 13 "yaccGrass.ml"
let yytransl_const = [|
    0 (* EOF *);
  257 (* SMALL_V *);
    0|]

let yytransl_block = [|
  258 (* CAPITAL_WS *);
  259 (* SMALL_WS *);
    0|]

let yylhs = "\255\255\
\001\000\002\000\002\000\003\000\003\000\004\000\004\000\006\000\
\007\000\007\000\005\000\005\000\000\000"

let yylen = "\002\000\
\002\000\001\000\003\000\001\000\002\000\000\000\002\000\002\000\
\001\000\002\000\001\000\002\000\002\000"

let yydefred = "\000\000\
\000\000\000\000\000\000\000\000\013\000\000\000\000\000\004\000\
\000\000\000\000\000\000\010\000\012\000\001\000\000\000\005\000\
\007\000\008\000\003\000"

let yydgoto = "\002\000\
\005\000\006\000\007\000\008\000\009\000\010\000\011\000"

let yysindex = "\005\000\
\002\255\000\000\000\255\007\255\000\000\011\000\011\255\000\000\
\000\255\000\255\007\255\000\000\000\000\000\000\002\255\000\000\
\000\000\000\000\000\000"

let yyrindex = "\000\000\
\003\000\000\000\010\255\001\000\000\000\000\000\014\000\000\000\
\003\000\003\000\000\000\000\000\000\000\000\000\003\000\000\000\
\000\000\000\000\000\000"

let yygindex = "\000\000\
\000\000\002\000\000\000\255\255\252\255\000\000\012\000"

let yytablesize = 260
let yytable = "\013\000\
\011\000\003\000\006\000\003\000\004\000\001\000\018\000\016\000\
\017\000\004\000\014\000\015\000\009\000\002\000\012\000\000\000\
\019\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\011\000\011\000\006\000"

let yycheck = "\004\000\
\000\000\002\001\000\000\002\001\003\001\001\000\011\000\009\000\
\010\000\003\001\000\000\001\001\003\001\000\000\003\000\255\255\
\015\000\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\001\001\002\001\001\001"

let yynames_const = "\
  EOF\000\
  SMALL_V\000\
  "

let yynames_block = "\
  CAPITAL_WS\000\
  SMALL_WS\000\
  "

let yyact = [|
  (fun _ -> failwith "parser")
; (fun parser_env ->
    let _1 = (peek_val parser_env 1 : 'code) in
    Obj.repr(
# 19 "yaccGrass.mly"
( _1 )
# 141 "yaccGrass.ml"
               : Grass.code))
; (fun parser_env ->
    let _1 = (peek_val parser_env 0 : 'inst) in
    Obj.repr(
# 23 "yaccGrass.mly"
( _1 )
# 148 "yaccGrass.ml"
               : 'code))
; (fun parser_env ->
    let _1 = (peek_val parser_env 2 : 'inst) in
    let _3 = (peek_val parser_env 0 : 'code) in
    Obj.repr(
# 25 "yaccGrass.mly"
( _1@_3 )
# 156 "yaccGrass.ml"
               : 'code))
; (fun parser_env ->
    let _1 = (peek_val parser_env 0 : 'apps) in
    Obj.repr(
# 29 "yaccGrass.mly"
( fargs2code _1 )
# 163 "yaccGrass.ml"
               : 'inst))
; (fun parser_env ->
    let _1 = (peek_val parser_env 1 : 'small_ws) in
    let _2 = (peek_val parser_env 0 : 'apps) in
    Obj.repr(
# 31 "yaccGrass.mly"
( [Abs(_1,_2)] )
# 171 "yaccGrass.ml"
               : 'inst))
; (fun parser_env ->
    Obj.repr(
# 35 "yaccGrass.mly"
( [] )
# 177 "yaccGrass.ml"
               : 'apps))
; (fun parser_env ->
    let _1 = (peek_val parser_env 1 : 'app) in
    let _2 = (peek_val parser_env 0 : 'apps) in
    Obj.repr(
# 37 "yaccGrass.mly"
( _1::_2 )
# 185 "yaccGrass.ml"
               : 'apps))
; (fun parser_env ->
    let _1 = (peek_val parser_env 1 : 'capital_ws) in
    let _2 = (peek_val parser_env 0 : 'small_ws) in
    Obj.repr(
# 41 "yaccGrass.mly"
( {f=_1;arg=_2} )
# 193 "yaccGrass.ml"
               : 'app))
; (fun parser_env ->
    let _1 = (peek_val parser_env 0 : int) in
    Obj.repr(
# 45 "yaccGrass.mly"
( _1 )
# 200 "yaccGrass.ml"
               : 'capital_ws))
; (fun parser_env ->
    let _1 = (peek_val parser_env 1 : int) in
    let _2 = (peek_val parser_env 0 : 'capital_ws) in
    Obj.repr(
# 47 "yaccGrass.mly"
( _1+_2 )
# 208 "yaccGrass.ml"
               : 'capital_ws))
; (fun parser_env ->
    let _1 = (peek_val parser_env 0 : int) in
    Obj.repr(
# 51 "yaccGrass.mly"
( _1 )
# 215 "yaccGrass.ml"
               : 'small_ws))
; (fun parser_env ->
    let _1 = (peek_val parser_env 1 : int) in
    let _2 = (peek_val parser_env 0 : 'small_ws) in
    Obj.repr(
# 53 "yaccGrass.mly"
( _1+_2 )
# 223 "yaccGrass.ml"
               : 'small_ws))
(* Entry entry *)
; (fun parser_env -> raise (YYexit (peek_val parser_env 0)))
|]
let yytables =
  { actions=yyact;
    transl_const=yytransl_const;
    transl_block=yytransl_block;
    lhs=yylhs;
    len=yylen;
    defred=yydefred;
    dgoto=yydgoto;
    sindex=yysindex;
    rindex=yyrindex;
    gindex=yygindex;
    tablesize=yytablesize;
    table=yytable;
    check=yycheck;
    error_function=parse_error;
    names_const=yynames_const;
    names_block=yynames_block }
let entry (lexfun : Lexing.lexbuf -> token) (lexbuf : Lexing.lexbuf) =
   (yyparse yytables 1 lexfun lexbuf : Grass.code)
