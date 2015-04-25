(* $Id: decompile.ml,v 1.4 2008/09/14 11:19:54 ksk Exp $ *)

open ExtSetMap
open Common
open Let
open Grass
open Format
open Print

module VarCounter = Counter(struct let init = 1 end)
let fresh_name () = sprintf "e%d" (VarCounter.fresh())
let last_name () = sprintf "e%d" (VarCounter.current())

let rec new_bound bound i =
  if i < 1 then bound else new_bound (fresh_name()::bound) (pred i)

module VTable = StrMap

let incr_table v table =
  let i = try VTable.find v table with Not_found -> 0 in
  VTable.add v (succ i) table

let decompile_farg bound table x =
  let f = List.nth bound (pred x.f)
  and arg = List.nth bound (pred x.arg) in
  LApp(LVar f,LVar arg), bound, incr_table f (incr_table arg table)

let rec decompile_code rev_exp bound table = function
  | [] -> let table = match bound with
      | [] -> failwith "An empty code is not allowed"
      | v::_ -> incr_table v (incr_table v table) in
    List.rev rev_exp, table
  | App fa::code ->
      let v = fresh_name () in
      let farg, bound, table = decompile_farg bound table fa in
      decompile_code ({name=v;bind=[];body=[],farg}::rev_exp) (v::bound) table code
  | Abs(i,fas)::code ->
      let bind = new_bound [] i in
      let local_bound = List.rev_append bind bound in
      let rev_abind, _, table = 
        List.fold_left (fun(rev_abind,bound,table) fa ->
                          let v = fresh_name () in
                          let farg, bound, table =
                            decompile_farg bound table fa in
                          (v, farg)::rev_abind, v::bound, table)
          ([],local_bound,table) fas in
      match rev_abind with
        | (v,abody)::rev_abind ->
            decompile_code 
              ({name=v;bind=bind;body=List.rev rev_abind,abody}::rev_exp)
              (v::bound) table code
        | [] -> match local_bound with
            | x::_ -> 
                let v = fresh_name () in
                decompile_code 
                  ({name=v;bind=bind;body=[],LVar x}::rev_exp)
                  (v::bound) (incr_table x table) code
            | _ -> failwith "decompile_code: Unreachable branch"

let rename_unused_var table v = if VTable.mem v table then v else "_"

let rename_unused_body table (abind,abody) =
  List.map (fun (v,app) -> rename_unused_var table v, app) abind, abody

let rename_unused_single table se =
  { name = rename_unused_var table se.name;
    bind = List.map (rename_unused_var table) se.bind;
    body = rename_unused_body table se.body }

let rename_unused_exp table exp = List.map (rename_unused_single table) exp

let rec remove_singleuse_app btable : string app -> string app = function
  | LVar v as var -> begin try VTable.find v btable with Not_found -> var end
  | LApp(a1,a2) ->
      LApp(remove_singleuse_app btable a1, remove_singleuse_app btable a2)

let remove_singleuse_body table btable (abind,abody) =
  let rev_abind, btable =
    List.fold_left (fun (rev_abind,btable) (v,app) ->
                      let app = remove_singleuse_app btable app in
                      if VTable.find_some v table = Some 1 then
                        rev_abind, VTable.add v app btable
                      else (v,app)::rev_abind, btable) ([],btable) abind in
  List.rev rev_abind, remove_singleuse_app btable abody

let rec remove_singleuse table btable : string exp -> string exp = function
  | [] -> []
  | se::exp ->
      let (abind,abody) as body = remove_singleuse_body table btable se.body in
      if se.bind = [] && VTable.find_some se.name table = Some 1 && abind = [] then
        remove_singleuse table (VTable.add se.name abody btable) exp
      else { se with body = body }::remove_singleuse table btable exp

module FCounter = Counter(struct let init = 1 end)
module VCounter = Counter(struct let init = 1 end)
module XCounter = Counter(struct let init = 1 end)
module TCounter = Counter(struct let init = 1 end)
let fresh_f () = sprintf "f%d" (FCounter.fresh())
let fresh_v () = sprintf "v%d" (VCounter.fresh())
let fresh_x () = sprintf "x%d" (XCounter.fresh())
let fresh_t () = sprintf "t%d" (TCounter.fresh())

let rec rename_bind rev_bind table = function 
  | [] -> List.rev rev_bind, table
  | v::bind ->
      let x = if v = "_" then v else fresh_x () in
      rename_bind (x::rev_bind) (VTable.add v x table) bind

let rec rename_app table = function
  | LVar v as var -> begin try LVar(VTable.find v table) with Not_found -> var end
  | LApp(a1,a2) -> LApp(rename_app table a1,rename_app table a2)

let rename_body table (abind,abody) =
  let rev_abind, table =
    List.fold_left
      (fun (rev_abind,table) (v,app) ->
         let t = if v = "_" then v else fresh_t () in
         (t,rename_app table app)::rev_abind,
         VTable.add v t table) ([],table) abind in
  List.rev rev_abind, rename_app table abody

let rec rename table : string exp -> string exp = function
  | [] -> []
  | se::exp ->
      XCounter.reset (); TCounter.reset ();
      let bind, table = rename_bind [] table se.bind in
      let name =
        if se.name = "_" then se.name
        else if bind = [] then fresh_v () else fresh_f () in
      { name = name; bind = bind; body = rename_body table se.body }
      ::rename (VTable.add se.name name table) exp

let decompile code : string exp =
  VarCounter.reset ();
  let exp, table = decompile_code [] (List.rev built_in) VTable.empty code in
  let exp = rename_unused_exp table exp in
  let exp = remove_singleuse table VTable.empty exp in
  FCounter.reset (); VCounter.reset (); XCounter.reset (); TCounter.reset ();
  let exp = rename VTable.empty exp in
  exp


  
