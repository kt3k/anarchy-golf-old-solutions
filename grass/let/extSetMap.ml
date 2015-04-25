(* $Id: extSetMap.ml,v 1.1 2008/09/12 10:35:10 ksk Exp $ *)
(* Wrapper of Set/Map module for better interface *)

open Format
open Print

(* pretty printer *)
module Set = struct
  module Make(Ord:Set.OrderedType) : sig
    include Set.S with type elt = Ord.t
    val pp_t :
      string -> (Format.formatter -> elt -> unit) -> Format.formatter -> t -> unit
  end = struct
    module S = Set.Make(Ord)
    include S
    let pp_t set_name pp_elt fmt set =
      fprintf fmt "@[<2>%s{@," set_name;
      ignore (S.fold (fun elt is_fst ->
                        if is_fst then pp_elt fmt elt
                        else fprintf fmt ",@,%a" pp_elt elt;
                        false) set true);
      fprintf fmt "}@]"
  end
end

module Map = struct
  module Make(Ord:Map.OrderedType) : sig
    include Map.S with type key = Ord.t
    val find_some : key -> 'a t -> 'a option
    val pp_t :
      string -> (Format.formatter -> key -> unit) ->
      (Format.formatter -> 'a -> unit) ->
      Format.formatter -> 'a t -> unit
  end = struct
    module M = Map.Make(Ord)
    include M
    let find_some key t = try Some(M.find key t) with Not_found -> None
    let pp_t map_name pp_key pp_a fmt map =
      fprintf fmt "@[<2>%s{@," map_name;
      let pp_each key fmt v = fprintf fmt "@[<2>%a => @,%a@]" pp_key key pp_a v in
      ignore (M.fold (fun key v is_fst ->
                        if is_fst then pp_each key fmt v
                        else fprintf fmt ";@;%a" (pp_each key) v;
                        false) map true);
      fprintf fmt "}@]"

  end
end
