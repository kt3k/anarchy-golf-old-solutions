(* $Id: main.ml,v 1.5 2008/09/14 09:59:51 ksk Exp $ *)

open Format

let run_mode = ref true
let input_file = ref ""
let output_file = ref ""

let usage_msg = "Usage: "^Sys.argv.(0)
  ^" program.(grass|let) [-o program.(let|grass)]"
let usage () = prerr_endline usage_msg; exit 1

let rec add_spec keys spec doc speclist = match keys with
  | [] -> speclist
  | key::keys' -> add_spec keys' spec doc ((key,spec," "^doc)::speclist)
let rec add_speclist ks_spcl spcl = match ks_spcl with
  | [] -> Arg.align spcl
  | (keys,spec,doc)::rest -> add_speclist rest (add_spec keys spec doc spcl)
let make_speclist ks_spcl = add_speclist ks_spcl []

let speclist = make_speclist [
  ["-o";"--output"], Arg.Set_string output_file,
  "Set output file name";
  ["-";"--stdout"], Arg.Unit(fun() -> output_file := "-"),
  "Output the (de)compiled program to the standard output";
]

let anon_fun str = input_file := str

let parse_grass file =
  Parse.parse_file ~yacc:YaccGrass.entry ~lex:LexGrass.token file

let parse_let file =
  Parse.parse_file ~yacc:YaccLet.entry ~lex:LexLet.token file

let () =
  Arg.parse speclist anon_fun usage_msg;
  if !input_file = "" then usage ();
  if !output_file = "" then
    let grass = 
      if Filename.check_suffix !input_file ".grass" then parse_grass !input_file
      else
        let exp = parse_let !input_file in
        let g = Compile.compile exp in
        let tmp = Filename.temp_file "let" ".grass" in
        let oc = open_out tmp in
        Grass.output oc g;
        close_out oc;
        parse_grass tmp
    in
    ignore(Eval.eval grass);
    flush stdout;
  else
    let oc = if !output_file = "-" then stdout else open_out !output_file in
    begin if Filename.check_suffix !input_file ".grass" then
      let exp = Decompile.decompile (parse_grass !input_file) in
      Let.output oc exp
    else
      let code = Compile.compile (parse_let !input_file) in
      Grass.output oc code 
    end;
    close_out oc
