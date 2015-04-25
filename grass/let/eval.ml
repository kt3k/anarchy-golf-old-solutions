(* $Id: eval.ml,v 1.6 2008/09/14 10:16:49 ksk Exp $ *)

open Common
open Grass
open Format

exception Not_a_char of string

type sem = Fn of code * env | In | Out | Succ | Char of int
and env = sem list

let init_env = [Out;Succ;Char(Char.code 'w');In]
and init_dump = [ [App{f=1;arg=1}],[]; [],[] ]

let string_of_sem = function
  | Char i -> sprintf "Char(%i)%!" i
  | Fn _ -> "Fn(...)"
  | In -> "In"
  | Out -> "Out"
  | Succ -> "Succ"
    

let char_of arg caller = match arg with
  | Char i -> i
  | Fn _ | In | Out | Succ -> 
      raise(Not_a_char
              (sprintf"%s cannot be applied to %s."
                 (string_of_sem caller) (string_of_sem arg)))

let church_bool b =
  if b then Fn([Abs(1,[{f=3;arg=2}])],[Fn([],[])])
  else Fn([Abs(1,[])],[])

let rec mth_nth m n = function
  | [] -> invalid_arg "mth_nth"
  | x::xs -> 
      if m = 1 then x, (if n = 1 then x else List.nth xs (n-2))
      else if n = 1 then (if m = 1 then x else List.nth xs (m-2)), x
      else mth_nth (pred m) (pred n) xs

let rec next_many code env dump = match code with
  | App fa::c -> begin match mth_nth fa.f fa.arg env with
      | Fn(fc,e), arg ->
          next_many fc (arg::e) ((c,env)::dump)
      | In, arg ->
          let chr = try Char(input_byte stdin) with End_of_file -> arg in
          next_many c (chr::env) dump
      | Out, arg ->
          output_byte stdout (char_of arg Out); (* flush stdout; *)
          next_many c (arg::env) dump
      | Succ, arg ->
          next_many c (Char(255 land succ(char_of arg Succ))::env) dump
      | Char i as fn, arg ->
          next_many c (church_bool(i=char_of arg fn)::env) dump end
  | Abs(n,c')::c ->
      if n = 1 then next_many c (Fn(fargs2code c',env)::env) dump
      else next_many c (Fn([Abs(pred n,c')],env)::env) dump
  | [] -> match env with
      | [] -> failwith "state.env is empty."
      | f::e -> match dump with
          | [] -> if e <> [] then failwith "state.dump is empty."
          | (c',e')::d -> next_many c' (f::e') d

let eval code = next_many code init_env init_dump
