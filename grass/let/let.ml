(* $Id: let.ml,v 1.5 2008/09/14 09:54:09 ksk Exp $ *)

open Format
open Print

type 'var app = LVar of 'var | LApp of 'var app * 'var app
type 'var single_exp = { name: 'var;
                         bind: 'var list;
                         body: ('var * 'var app) list * 'var app }

type 'var exp = 'var single_exp list

exception IntExp of int exp * string
let strSucc = "Succ"
and strPutc = "Out"
and strGetc = "In"
and strW = "W"
let built_in = [strGetc;strW;strSucc;strPutc]

let rec pp_app pp_var paren fmt = function
  | LVar v -> pp_var fmt v
  | LApp(a1,a2) ->
      if paren then
        fprintf fmt "@[<3>(%a@;%a)@]"
          (pp_app pp_var false) a1 (pp_app pp_var true) a2
      else
        fprintf fmt "@[<2>%a@;%a@]"
          (pp_app pp_var false) a1 (pp_app pp_var true) a2

let pp_app pp_var = pp_app pp_var false

let pp_body pp_var fmt (abind,abody) =
  List.iter (fun (v,app) ->
               if v = "_" then fprintf fmt "@[<2>%a@];@\n" (pp_app pp_var) app
               else
                 fprintf fmt "@[<2>let %a =@;%a in@]@\n"
                   pp_var v (pp_app pp_var) app) abind;
  fprintf fmt "@[<2>%a@]" (pp_app pp_var) abody

let pp_single_exp pp_var fmt se =
  fprintf fmt "@[<2>let %a" pp_var se.name;
  List.iter (fprintf fmt " %a" pp_var) se.bind;
  fprintf fmt " =@;@[%a@]@]@." (pp_body pp_var) se.body
  
let pp_exp pp_var fmt exp =
  List.iter (pp_single_exp pp_var fmt) exp

let output ch exp =
  pp_exp (fun fmt -> fprintf fmt "%s") (formatter_of_out_channel ch) exp

let print exp = output stdout exp
