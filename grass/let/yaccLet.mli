type token =
  | EOF
  | LET
  | EQ
  | IN
  | LPAREN
  | RPAREN
  | SEMICOLON
  | SUCC
  | GETC
  | PUTC
  | W
  | VAR of (string)

val entry :
  (Lexing.lexbuf  -> token) -> Lexing.lexbuf -> string Let.exp
