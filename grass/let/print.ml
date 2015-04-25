(* $Id: print.ml,v 1.1 2008/09/12 10:35:10 ksk Exp $ *)
(* Common functions for pretty printers *)

open Format

let string_of pp_a x =
  pp_a str_formatter x;
  flush_str_formatter ()

let pp_list pp_a fmt xs =
  fprintf fmt "@[<1>[";
  begin match xs with
    | [] -> ()
    | x::xs -> pp_a fmt x; List.iter (fprintf fmt ";@;%a" pp_a) xs end;
  fprintf fmt "]@]"

let pp_string fmt = fprintf fmt "%S"

let pp_int fmt = fprintf fmt "%d"

let pp_bool fmt = fprintf fmt "%B"

let pp_option pp_a fmt = function
  | None -> fprintf fmt "None"
  | Some x -> fprintf fmt "@[<2>Some@,(%a)@]" pp_a x

let pp_pair pp_a pp_b fmt (x,y) =
  fprintf fmt "@[<1>(%a,@,%a)@]" pp_a x pp_b y

type pp_field = { pp_field: 'a. 'a pp_neg_field -> 'a }
and 'b pp_neg_field = { pp_neg: 'a. string -> (formatter -> 'a -> unit) -> 'a -> 'b }
let pp_field name pp_a x = { pp_field = fun k -> k.pp_neg name pp_a x }

let pp_each_field fmt f =
  f.pp_field { pp_neg = fun name -> fprintf fmt "@[<2>%s = @,@[%a@]@]" name }

let pp_record (pp_fs:pp_field list) fmt = 
  fprintf fmt "@[<1>{";
  begin match pp_fs with
    | [] -> ()
    | f::fs ->
        pp_each_field fmt f;
        List.iter (fprintf fmt ";@;%a" pp_each_field) fs end;
  fprintf fmt "}@]"

