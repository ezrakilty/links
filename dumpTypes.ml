(*
  This function is intended to be used to dump the types and
  positions of all variables in a program. It should be useful for
  enabling Tom's IDE to display typing tooltips for variables.

  Technically the dumper is incorrect because the current environment
  does not necessarily respect lexical scope. However, it should work
  anyway as the type checker ensures the program is well-typed and in
  particular that there are no free variables. 
*)
let program : Types.typing_environment -> string -> (string * Types.datatype * Sugartypes.position) list =
  fun tyenv filename ->
    let dumper = object (o)
      inherit SugarTraversals.fold as super

      val env = Env.String.empty
      val vars = []
        
      method get_vars () = vars

      method bind (x, t, pos) =
        {< env = Env.String.bind env (x, t); vars = (x, t, pos)::vars >}

      method use (x, t, pos) =
        {< vars = (x, t, pos)::vars >}

      method bound x = Env.String.has env x

      method lookup x =
        Env.String.lookup env x

      method binder =
        fun (x, t, pos) ->
          o#option
            (fun o t -> o#bind (x, t, pos))
            t

      method phrase =
        function
          | `Var x, pos when o#bound x ->
              o#use (x, o#lookup x, pos)
          | e -> super#phrase e
    end in
    let program =
      Errors.display_fatal_l
        (lazy
           (let sugar, pos_context = Parse.parse_string ~pp:(Settings.get_value Basicsettings.pp) Parse.program filename in
            let program, _, _ = Frontend.Pipeline.program tyenv pos_context sugar in
              program))
    in
      (dumper#program program)#get_vars()    
