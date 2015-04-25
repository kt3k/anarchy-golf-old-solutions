(* $Id: compile.ml,v 1.4 2008/09/14 09:54:09 ksk Exp $ *)

open Common
open Let
open Grass
open Print
open Format
open ExtSetMap

module VCounter = Counter(struct let init = 1 end)

let rec rename_bind env rev_bind = function 
  | [] -> List.rev rev_bind, env
  | v::vs ->
      let i = VCounter.fresh () in
      rename_bind (StrMap.add v i env) (i::rev_bind) vs

let rec rename_app env : string app -> int app = function
  | LVar "_" -> LVar (-1)
  | LVar v -> begin try LVar(StrMap.find v env) with
        Not_found -> failwith (sprintf "Unbound variable (%s)" v) end
  | LApp(a1,a2) -> LApp(rename_app env a1,rename_app env a2)

let rec rename_abind env rev_abind = function
  | [] -> List.rev rev_abind, env
  | (v,app)::rest ->
      let i = VCounter.fresh () in
      rename_abind (StrMap.add v i env)
        ((i,rename_app env app)::rev_abind) rest

let rec rename_body env (abind,abody) =
  let abind, env = rename_abind env [] abind in
  abind, rename_app env abody
    
let rec rename env (exp:string exp) : int exp = match exp with
  | [] -> []
  | se::ses ->
      let bind,benv = rename_bind env [] se.bind in
      let i = VCounter.fresh () in
      { name = i;
        bind = bind;
        body = rename_body benv se.body }::rename (StrMap.add se.name i env) ses

type let_bind = { var:int; app: int farg }
let rec add_let_abind lbs : int app -> int * let_bind list = function
  | LVar v -> v, lbs
  | LApp(a1,a2) ->
      let v1, lbs = add_let_abind lbs a1 in
      let v2, lbs = add_let_abind lbs a2 in
      let v = VCounter.fresh () in
      v, {var=v;app={f=v1;arg=v2}}::lbs

let rec add_let_bind lbs = function
  | [] -> lbs
  | (v,LApp(a1,a2))::rest ->
      let v1, lbs = add_let_abind lbs a1 in
      let v2, lbs = add_let_abind lbs a2 in
      add_let_bind ({var=v;app={f=v1;arg=v2}}::lbs) rest
  | (v,LVar v1)::rest ->
      failwith "The let-body with no application is not supported (01)."

let let_intro_body (abind,abody) =
  let lbs = add_let_bind [] abind in
  let app,lbs = match abody with
    | LApp(a1,a2) ->
        let v1, lbs = add_let_abind lbs a1 in
        let v2, lbs = add_let_abind lbs a2 in
        LApp(LVar v1,LVar v2), lbs
    | LVar v ->
        LVar v, lbs in
  List.fold_left
    (fun abind lb -> (lb.var,LApp(LVar lb.app.f,LVar lb.app.arg))::abind) [] lbs, app

let body_to_singles name (abind,abody) =
  List.rev
    ({name=name;bind=[];body=[],abody}::
       List.fold_left (fun rev (v,app) -> {name=v;bind=[];body=[],app}::rev) [] abind)

let let_intro_single se =
  if se.bind = [] then body_to_singles se.name (let_intro_body se.body)
  else [{ se with body = let_intro_body se.body }]
let let_intro (exp:int exp) : int exp =
  List.concat (List.map let_intro_single exp)

let rec index hd_idx x = function
  | [] -> raise Not_found
  | e::es -> if x = e then hd_idx else index (succ hd_idx) x es

let rec vindex x bounds = if x < 0 then 1 else index 1 x bounds

let trans_app bound = function
  | LApp(LVar v1,LVar v2) -> {f=vindex v1 bound;arg=vindex v2 bound}
  | _ -> failwith "The let-body with no application is not supported (02)."

let rec trans_abind bound rev_grass = function
  | [] -> rev_grass, bound
  | (v,LApp(LVar v1,LVar v2))::rest ->
      trans_abind (v::bound) ({f=vindex v1 bound;
                               arg=vindex v2 bound}::rev_grass) rest
  | _ -> failwith "The let-body with no application is not supported (03)."

let trans_body bound = function
    | [], LVar v -> begin match bound with
        | x::_ when x = v -> []
        | _ -> failwith "The let-body with no application is not supported (04)." end
    | abind, abody ->
        let rev_grass, bound = trans_abind bound [] abind in
        List.rev (trans_app bound abody::rev_grass)

let trans_single_rev bound exp =
  if exp.bind = [] then
    List.rev_map (fun fa -> App fa)
      (trans_body (List.rev_append exp.bind bound) exp.body)
  else
    [Abs(List.length exp.bind, trans_body (List.rev_append exp.bind bound) exp.body)]

let rec trans_exp bound rev_grass : int exp -> code = function
  | [] -> List.rev rev_grass
  | se::ses ->
      trans_exp (se.name::bound)
        (List.rev_append (trans_single_rev bound se) rev_grass) ses
    
let compile exp =
  VCounter.reset ();
  let env,bound =
    List.fold_left (fun (env,bound) v ->
                      let i = VCounter.fresh () in
                      StrMap.add v i env, i::bound) (StrMap.empty,[]) built_in in
  let exp = rename env exp in
  let exp = let_intro exp in
  trans_exp bound [] exp

