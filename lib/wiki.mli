(* $Id: wiki.mli,v 5.8 2007-09-12 09:58:44 ddr Exp $ *)
(* Copyright (c) 1998-2007 INRIA *)

open Config

type wiki_info =
  { wi_mode : string;
    wi_file_path : string -> string;
    wi_person_exists : string * string * int -> bool;
    wi_always_show_link : bool }

val syntax_links : config -> wiki_info -> string -> string

val html_of_tlsw : config -> string -> string list
val html_with_summary_of_tlsw
  : config
  -> wiki_info
  -> (bool * string * string) option
  -> string
  -> string

val extract_sub_part : string -> int -> string list
val split_title_and_text : string -> (string * string) list * string

val print_sub_part
  : config
  -> wiki_info
  -> bool
  -> string
  -> string
  -> int
  -> string list
  -> unit

(** [print_mod_view_page conf can_edit mode fname title env s] *)
val print_mod_view_page
  : config                      (* conf *)
  -> bool                       (* can_edit *)
  -> Adef.encoded_string        (* mode *)
  -> string                     (* fname *)
  -> (bool -> unit)             (* title *)
  -> (string * string) list     (* env *)
  -> string                     (* s *)
  -> unit

(** [print_mod_ok conf wi edit_mode fname read_string commit string_filter title_is_1st] *)
val print_mod_ok
  : config                                       (* conf *)
  -> wiki_info                                   (* wi *)
  -> (string -> string option)                   (* edit_mode *)
  -> (string option -> string)                   (* fname *)
  -> (string -> (string * string) list * string) (* read_string *)
  -> (string -> string -> unit)                  (* commit *)
  -> (string -> string)                          (* string_filter *)
  -> bool                                        (* title_is_1st *)
  -> unit

val notes_aliases : config -> (string * string) list
val map_notes : (string * string) list -> string -> string
