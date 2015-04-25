(* $Id: grass.ml,v 1.7 2008/09/14 09:17:06 ksk Exp $ *)

open Common
open Format

type code = inst list
and inst = App of int farg | Abs of int * int farg list

(* let fargs2code fargs = List.map (fun fa -> App fa) fargs *)
let fargs2code fargs = List.rev_map (fun fa -> App fa) (List.rev fargs)

let rec integrate_app_seq rev_code rev_apps = function
  | [] -> List.rev (if rev_apps = [] then rev_code
                    else Abs(0,List.rev rev_apps)::rev_code)
  | Abs(0,apps)::code ->
      integrate_app_seq rev_code (List.rev_append apps rev_apps) code
  | App fa::code ->
      integrate_app_seq rev_code (fa::rev_apps) code
  | (Abs _ as i)::code ->
      if rev_apps = [] then integrate_app_seq (i::rev_code) [] code
      else integrate_app_seq (i::Abs(0,List.rev rev_apps)::rev_code) [] code
  
let string_of_farg x = String.make x.f 'W' ^ String.make x.arg 'w'

let rec string_of_inst = function
  | App fa -> string_of_farg fa
  | Abs(n,c) ->
      String.make n 'w' ^ String.concat "" (List.map string_of_farg c)

let string_of_code code =
  String.concat "v"
    (List.map string_of_inst (integrate_app_seq [] [] code))

let output ch code = output_string ch (string_of_code code)
let print code = output stdout code
