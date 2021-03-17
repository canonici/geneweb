(* $Id: adef.mli,v 5.6 2007-02-21 18:14:01 ddr Exp $ *)
(* Copyright (c) 1998-2007 INRIA *)

type fix
type cdate
type 'person gen_couple

type date =
    Dgreg of dmy * calendar
  | Dtext of string
and calendar = Dgregorian | Djulian | Dfrench | Dhebrew
and dmy =
  { day : int; month : int; year : int; prec : precision; delta : int }
and dmy2 = { day2 : int; month2 : int; year2 : int; delta2 : int }
and precision =
    Sure
  | About
  | Maybe
  | Before
  | After
  | OrYear of dmy2
  | YearInt of dmy2

val float_of_fix : fix -> float
val fix_of_float : float -> fix
external fix : int -> fix = "%identity"
external fix_repr : fix -> int = "%identity"

val no_consang : fix

val date_of_cdate : cdate -> date
val cdate_of_date : date -> cdate

val cdate_None : cdate
val od_of_cdate : cdate -> date option
val cdate_of_od : date option -> cdate

val father : 'a gen_couple -> 'a
val mother : 'a gen_couple -> 'a
val couple : 'a -> 'a -> 'a gen_couple
val parent : 'a array -> 'a gen_couple
val parent_array : 'a gen_couple -> 'a array

val multi_couple : 'a -> 'a -> 'a gen_couple
val multi_parent : 'a array -> 'a gen_couple

type +'a astring = private string
type safe_string = [`encoded|`escaped|`safe] astring
type escaped_string = [`encoded|`escaped] astring
type encoded_string = [`encoded] astring
val ( ^^^ ) : 'a astring -> 'a astring -> 'a astring
val ( ^>^ ) : 'a astring -> string -> 'a astring
val ( ^<^ ) : string -> 'a astring -> 'a astring
val safe : string -> safe_string
val escaped : string -> escaped_string
val encoded : string -> encoded_string
val safe_fn : (string -> string) -> 'a astring -> 'a astring
