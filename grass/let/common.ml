(* $Id: common.ml,v 1.2 2008/09/14 11:19:54 ksk Exp $ *)

open ExtSetMap
open Print

module Counter (M : sig val init : int end) : sig
  val reset : unit -> unit
  val current : unit -> int
  val fresh : unit -> int
end = struct
  let count = ref M.init
  let reset () = count := M.init
  let current () = !count
  let fresh () = let cur = !count in incr count; cur
end 

(* let reset_count, fresh_count = *)
(*   let count = ref 0 in *)
(*   (fun () -> count := 0), *)
(*   (fun () -> let cur = !count in incr count; cur) *)

type 'a farg = { f: 'a; arg: 'a }

module StrMap = Map.Make (struct type t = string let compare = compare end)
module IntMap = Map.Make (struct type t = int let compare = compare end)  

let pp_int_str_map = StrMap.pp_t "StrMap" pp_string pp_int
