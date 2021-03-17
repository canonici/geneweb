(* Copyright (c) 1998-2007 INRIA *)

open Config
open Def
open Gwdb

(** [get_wday conf date]
    Return the day of the week for this [date] *)
val get_wday : config -> date -> string

val code_dmy : config -> dmy -> string
val string_of_ondate : ?link:bool -> config -> date -> Adef.safe_string
val string_of_date : config -> date -> Adef.safe_string
val string_slash_of_date : config -> date -> Adef.safe_string
val string_of_age : config -> dmy -> Adef.safe_string
val prec_year_text : config -> dmy -> string
val prec_text : config -> dmy -> string
val day_text : dmy -> string
val month_text : dmy -> string
val year_text : dmy -> string
val short_dates_text : config -> base -> person -> Adef.safe_string
val short_marriage_date_text : config -> base -> family -> person -> person -> Adef.safe_string
val print_dates : config -> base -> person -> unit

(** [death_symbol conf]
    Return the value associated to ["death_symbol"] in [.gwf] file
    if it is defined, or use ["†"] if it is not.
 *)
val death_symbol : config -> string

val string_of_dmy : config -> dmy -> Adef.safe_string
val string_of_on_french_dmy : config -> dmy -> Adef.safe_string
val string_of_on_hebrew_dmy : config -> dmy -> Adef.safe_string
val string_of_prec_dmy : config -> string -> string -> dmy -> Adef.safe_string
val gregorian_precision : config -> dmy -> Adef.safe_string
val french_month : config -> int -> string
val code_french_year : config -> int -> string
val code_hebrew_date : config -> int -> int -> int -> string

(** [string_of_date_aux ~dmy:string_of_dmy ~sep:" " conf d] *)
val string_of_date_aux
  : ?link:bool
  -> ?dmy:(Config.config -> Def.dmy -> Adef.safe_string)
  -> ?sep:Adef.safe_string
  -> Config.config
  -> Def.date
  -> Adef.safe_string
