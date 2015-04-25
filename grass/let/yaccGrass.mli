type token =
  | EOF
  | SMALL_V
  | CAPITAL_WS of (int)
  | SMALL_WS of (int)

val entry :
  (Lexing.lexbuf  -> token) -> Lexing.lexbuf -> Grass.code
