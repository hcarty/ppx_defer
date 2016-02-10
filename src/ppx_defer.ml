open Ast_mapper
open Parsetree

(**
   {[
     [%defer later];
     now
   ]}

   will evaluate [later] after [now].  For example:

   {[
     let ic = open_in_bin "test.ml" in
     [%defer close_in ic];
     let length = in_channel_length ic in
     let bytes = really_input_string ic length in
     print_endline bytes
   ]}

   will close [ic] after reading and printing its content.
*)

let make_defer ~later ~now =
  (* Evaluate [now] then [later], even if [now] raises an exception *)
  [%expr
    match [%e now] with
    | __ppx_defer_actual_result ->
      [%e later]; __ppx_defer_actual_result
    | exception __ppx_defer_actual_exception ->
      [%e later]; raise __ppx_defer_actual_exception
  ] [@metaloc now.pexp_loc]

let defer_mapper _args =
  {
    default_mapper with
    expr = (
      fun mapper expr ->
        match expr with
        | [%expr [%defer [%e? later]] ; [%e? now]] ->
          let later, now = mapper.expr mapper later, mapper.expr mapper now in
          let generated = make_defer ~later ~now in
          let pexp_loc =
            (* [loc_ghost] tells the compiler and other tools than this is
               generated code *)
            { generated.pexp_loc with Location.loc_ghost = true }
          in
          { generated with pexp_loc }
        | _ ->
          default_mapper.expr mapper expr
    )
  }

let () = register "defer" defer_mapper
