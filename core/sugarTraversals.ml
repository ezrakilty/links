(* This file is generated mostly automatically using Hand in Left-or-right-handed 1.0.0 *)
(* Generated mostly automatically using Camlp4 in OCaml 3.10.0.

   NB: DO NOT EDIT (except to keep it in line with sugartypes.ml).

   When we switch to OCaml 3.10.x, and when the Camlp4MapGenerator
   filter which comes with camlp4 3.10.0 works sufficiently well we'll
   generate all this automatically instead of maintaining this file.
*)

open Operators
open CommonTypes
open SourceCode
open Sugartypes

class map =
  object ((o : 'self_type))
    method string : string -> string = o#unknown

    method option :
      'a 'a_out. ('self_type -> 'a -> 'a_out) -> 'a option -> 'a_out option =
      fun _f_a ->
        function | None -> None | Some _x -> let _x = _f_a o _x in Some _x

    method list :
      'a 'a_out. ('self_type -> 'a -> 'a_out) -> 'a list -> 'a_out list =
      fun _f_a ->
        function
        | [] -> []
        | _x :: _x_i1 ->
            let _x = _f_a o _x in
            let _x_i1 = o#list _f_a _x_i1 in _x :: _x_i1

    method int : int -> int = o#unknown

    method float : float -> float = o#unknown

    method char : char -> char = o#unknown

    method bool : bool -> bool = function | false -> false | true -> true

    method unary_op : UnaryOp.t -> UnaryOp.t =
      let open UnaryOp in function
      | Minus -> Minus
      | FloatMinus -> FloatMinus
      | Name _x -> let _x = o#name _x in Name _x

    method tyunary_op : tyarg list * UnaryOp.t -> tyarg list * UnaryOp.t =
      fun (_x, _x_i1) -> (_x, o#unary_op _x_i1)

    method binder : Binder.with_pos -> Binder.with_pos =
      fun bndr ->
        let name = o#name (Binder.to_name bndr) in
        let ty  = Binder.to_type bndr in
        let pos = WithPos.pos bndr |> o#position in
        let bndr' = Binder.(set_type (set_name bndr name) ty) in
        WithPos.map2 bndr' ~f_pos:(fun _ -> pos) ~f_node:(fun x -> x)

    method sentence : sentence -> sentence =
      function
      | Definitions _x ->
          let _x = o#list (fun o -> o#binding) _x in Definitions _x
      | Expression _x -> let _x = o#phrase _x in Expression _x
      | Directive _x -> let _x = o#directive _x in Directive _x

    method section : Section.t -> Section.t =
      let open Section in function
      | Minus -> Minus
      | FloatMinus -> FloatMinus
      | Project _x -> let _x = o#name _x in Project _x
      | Name _x -> let _x = o#name _x in Name _x

    method subkind : subkind -> subkind = fun x -> x

    method kind : kind -> kind = fun x -> x

    method freedom : freedom -> freedom = fun x -> x

    method type_variable : type_variable -> type_variable =
      fun (_x, _x_i1, _x_i2) ->
        let _x = o#name _x in
        let _x_i1 = o#kind _x_i1 in
        let _x_i2 = o#freedom _x_i2 in (_x, _x_i1, _x_i2)

    method known_type_variable : known_type_variable -> known_type_variable =
      fun (_x, _x_i1, _x_i2) ->
        let _x = o#name _x in
        let _x_i1 = o#option (fun o -> o#subkind) _x_i1 in
        let _x_i2 = o#freedom _x_i2 in (_x, _x_i1, _x_i2)

    method row_var : Datatype.row_var -> Datatype.row_var =
      let open Datatype in
      function
      | Closed -> Closed
      | Open _x ->
          let _x = o#known_type_variable _x in Open _x
      | Recursive ((_x, _x_i1)) ->
          let _x = o#name _x in
          let _x_i1 = o#row _x_i1 in Recursive ((_x, _x_i1))

    method row : Datatype.row -> Datatype.row =
      fun (_x, _x_i1) ->
        let _x =
          o#list
            (fun o (_x, _x_i1) ->
               let _x = o#name _x in
               let _x_i1 = o#fieldspec _x_i1 in (_x, _x_i1))
            _x in
        let _x_i1 = o#row_var _x_i1 in (_x, _x_i1)

    method replace_rhs : replace_rhs -> replace_rhs =
      function
      | Literal    _x -> let _x = o#string _x in Literal    _x
      | SpliceExpr _x -> let _x = o#phrase _x in SpliceExpr _x

    method regexflag : regexflag -> regexflag =
      fun flag -> flag

    method regex : regex -> regex =
      function
      | Range ((_x, _x_i1)) ->
          let _x = o#char _x in
          let _x_i1 = o#char _x_i1 in Range ((_x, _x_i1))
      | Simply _x -> let _x = o#string _x in Simply _x
      | Quote _x -> let _x = o#regex _x in Quote _x
      | Any -> Any
      | StartAnchor -> StartAnchor
      | EndAnchor -> EndAnchor
      | Seq _x -> let _x = o#list (fun o -> o#regex) _x in Seq _x
      | Alternate ((_x, _x_i1)) ->
          let _x = o#regex _x in
          let _x_i1 = o#regex _x_i1 in Alternate ((_x, _x_i1))
      | Group _x -> let _x = o#regex _x in Group _x
      | Repeat ((_x, _x_i1)) ->
          let _x = o#unknown _x in
          let _x_i1 = o#regex _x_i1 in Repeat ((_x, _x_i1))
      | Splice _x -> let _x = o#phrase _x in Splice _x
      | Replace ((_x, _x_i1)) ->
          let _x = o#regex _x in
          let _x_i1 = o#replace_rhs _x_i1 in Replace ((_x, _x_i1))

    method position : Position.t -> Position.t =
      fun pos ->
        let start = Position.start pos |> o#unknown in
        let finish = Position.finish pos |> o#unknown in
        let code = Position.code pos |> o#unknown in
        Position.make ~start ~finish ~code

    method datatype' : datatype' -> datatype' =
      fun (x, y) ->
        let x = o#datatype x in
        let y = o#unknown y in
          (x,y)

    method given_spawn_location : given_spawn_location -> given_spawn_location =
      function
        | ExplicitSpawnLocation p -> ExplicitSpawnLocation (o#phrase p)
        | l -> l

    method phrasenode : phrasenode -> phrasenode =
      function
      | Constant _x -> let _x = o#constant _x in Constant _x
      | Var _x -> let _x = o#name _x in Var _x
      | FreezeVar _x -> let _x = o#name _x in FreezeVar _x
      | QualifiedVar _xs ->
          let _xs = o#list (fun o -> o#name) _xs in QualifiedVar _xs
      | FunLit (_x, _x1, _x_i1, _x_i2) -> let _x_i1 = o#funlit _x_i1 in
                                           let _x_i2 = o#location _x_i2 in FunLit (_x, _x1, _x_i1, _x_i2)
      | Spawn (_spawn_kind, _given_spawn_location, _block_phr, _dt) ->
          let _given_spawn_location = o#given_spawn_location _given_spawn_location in
          let _block_phr = o#phrase _block_phr in
          Spawn (_spawn_kind, _given_spawn_location, _block_phr, _dt)
      | Query (_x, _x_i1, _x_i2) ->
          let _x =
            o#option
              (fun o (_x, _x_i1) ->
                 let _x = o#phrase _x in
                 let _x_i1 = o#phrase _x_i1 in (_x, _x_i1))
              _x in
          let _x_i1 = o#phrase _x_i1 in Query (_x, _x_i1, _x_i2)
      | ListLit (_x, _x_i1) ->
          let _x = o#list (fun o -> o#phrase) _x in ListLit (_x, _x_i1)
      | Iteration ((_x, _x_i1, _x_i2, _x_i3)) ->
          let _x = o#list (fun o -> o#iterpatt) _x in
          let _x_i1 = o#phrase _x_i1 in
          let _x_i2 = o#option (fun o -> o#phrase) _x_i2 in
          let _x_i3 = o#option (fun o -> o#phrase) _x_i3
          in Iteration ((_x, _x_i1, _x_i2, _x_i3))
      | Escape ((_x, _x_i1)) ->
          let _x = o#binder _x in
          let _x_i1 = o#phrase _x_i1 in Escape ((_x, _x_i1))
      | Section _x -> let _x = o#section _x in Section _x
      | Conditional ((_x, _x_i1, _x_i2)) ->
          let _x = o#phrase _x in
          let _x_i1 = o#phrase _x_i1 in
          let _x_i2 = o#phrase _x_i2 in Conditional ((_x, _x_i1, _x_i2))
      | Block ((_x, _x_i1)) ->
          let _x = o#list (fun o -> o#binding) _x in
          let _x_i1 = o#phrase _x_i1 in Block ((_x, _x_i1))
      | InfixAppl ((_x, _x_i1, _x_i2)) ->
          let _x = o#tybinop _x in
          let _x_i1 = o#phrase _x_i1 in
          let _x_i2 = o#phrase _x_i2 in InfixAppl ((_x, _x_i1, _x_i2))
      | RangeLit ((_x_i1, _x_i2)) ->
          let _x_i1 = o#phrase _x_i1 in
          let _x_i2 = o#phrase _x_i2 in RangeLit ((_x_i1, _x_i2))
      | Regex _x -> let _x = o#regex _x in Regex _x
      | UnaryAppl ((_x, _x_i1)) ->
          let _x = o#tyunary_op _x in
          let _x_i1 = o#phrase _x_i1 in UnaryAppl ((_x, _x_i1))
      | FnAppl ((_x, _x_i1)) ->
          let _x = o#phrase _x in
          let _x_i1 = o#list (fun o -> o#phrase) _x_i1
          in FnAppl ((_x, _x_i1))
      | TAbstr ((_x, _x_i1)) ->
          let _x_i1 = o#phrase _x_i1 in TAbstr ((_x, _x_i1))
      | TAppl ((_x, _x_i1)) ->
          let _x = o#phrase _x in TAppl ((_x, _x_i1))
      | TupleLit _x ->
          let _x = o#list (fun o -> o#phrase) _x in TupleLit _x
      | RecordLit ((_x, _x_i1)) ->
          let _x =
            o#list
              (fun o (_x, _x_i1) ->
                 let _x = o#name _x in
                 let _x_i1 = o#phrase _x_i1 in (_x, _x_i1))
              _x in
          let _x_i1 = o#option (fun o -> o#phrase) _x_i1
          in RecordLit ((_x, _x_i1))
      | Projection ((_x, _x_i1)) ->
          let _x = o#phrase _x in
          let _x_i1 = o#name _x_i1 in Projection ((_x, _x_i1))
      | With ((_x, _x_i1)) ->
          let _x = o#phrase _x in
          let _x_i1 =
            o#list
              (fun o (_x, _x_i1) ->
                 let _x = o#name _x in
                 let _x_i1 = o#phrase _x_i1 in (_x, _x_i1))
              _x_i1
          in With ((_x, _x_i1))
      | TypeAnnotation ((_x, _x_i1)) ->
          let _x = o#phrase _x in
          let _x_i1 = o#datatype' _x_i1 in TypeAnnotation ((_x, _x_i1))
      | Upcast ((_x, _x_i1, _x_i2)) ->
          let _x = o#phrase _x in
          let _x_i1 = o#datatype' _x_i1 in
          let _x_i2 = o#datatype' _x_i2 in Upcast ((_x, _x_i1, _x_i2))
      | Instantiate _x ->
          let _x = o#phrase _x in
          Instantiate _x
      | Generalise _x ->
          let _x = o#phrase _x in
          Generalise _x
      | ConstructorLit ((_x, _x_i1, _x_i2)) ->
          let _x = o#name _x in
          let _x_i1 = o#option (fun o -> o#phrase) _x_i1
          in ConstructorLit ((_x, _x_i1, _x_i2))
      | DoOperation (name, ps, t) ->
          let ps  = o#list (fun o -> o#phrase) ps in
          let t   = o#option (fun o -> o#unknown) t in
          DoOperation (name, ps, t)
      | Handle { sh_expr; sh_effect_cases; sh_value_cases; sh_descr } ->
         let m = o#phrase sh_expr in
         let params =
            o#option (fun o -> o#handle_params) sh_descr.shd_params
         in
         let eff_cases =
           o#list
             (fun o (lhs, rhs) ->
               let lhs = o#pattern lhs in
               let rhs = o#phrase rhs in (lhs, rhs)
         )
             sh_effect_cases
     in
         let val_cases =
           o#list
             (fun o (lhs, rhs) ->
               let lhs = o#pattern lhs in
               let rhs = o#phrase rhs in (lhs, rhs)
         )
             sh_value_cases
     in
         Handle { sh_expr = m; sh_effect_cases = eff_cases; sh_value_cases = val_cases; sh_descr = { sh_descr with shd_params = params } }
      | Switch ((_x, _x_i1, _x_i2)) ->
          let _x = o#phrase _x in
          let _x_i1 =
            o#list
              (fun o (_x, _x_i1) ->
                 let _x = o#pattern _x in
                 let _x_i1 = o#phrase _x_i1 in (_x, _x_i1))
              _x_i1 in
          let _x_i2 = o#option (fun o -> o#unknown) _x_i2
          in Switch ((_x, _x_i1, _x_i2))
      | Receive ((_x, _x_i1)) ->
          let _x =
            o#list
              (fun o (_x, _x_i1) ->
                 let _x = o#pattern _x in
                 let _x_i1 = o#phrase _x_i1 in (_x, _x_i1))
              _x in
          let _x_i1 = o#option (fun o -> o#unknown) _x_i1
          in Receive (_x, _x_i1)
      (* | Link ((_x, _x_i1)) -> *)
      (*     let _x = o#phrase _x in *)
      (*     let _x_i1 = o#phrase _x_i1 in Link ((_x, _x_i1)) *)
      | Select ((_x, _x_i1)) ->
          let _x = o#name _x in
          let _x_i1 = o#phrase _x_i1
          in Select (_x, _x_i1)
      | Offer ((_x, _x_i1, _x_i2)) ->
          let _x = o#phrase _x in
          let _x_i1 =
            o#list
              (fun o (_x, _x_i1) ->
                 let _x = o#pattern _x in
                 let _x_i1 = o#phrase _x_i1 in (_x, _x_i1))
              _x_i1 in
          let _x_i2 = o#option (fun o -> o#unknown) _x_i2
          in Offer (_x, _x_i1, _x_i2)
      | CP p -> CP (o#cp_phrase p)
      | DatabaseLit ((_x, _x_i1)) ->
          let _x = o#phrase _x in
          let _x_i1 =
            (fun (_x, _x_i1) ->
               let _x = o#option (fun o -> o#phrase) _x in
               let _x_i1 = o#option (fun o -> o#phrase) _x_i1 in (_x, _x_i1))
              _x_i1
          in DatabaseLit ((_x, _x_i1))
      | TableLit ((_x, (y, z), _x_i2, _x_i3, _x_i4)) ->
          let _x = o#phrase _x in
          let y = o#datatype y in
          let z = o#option
            (fun o r ->
               let r = o#unknown r in
                 r) z in
          let _x_i2 =
            o#list
              (fun o (_x, _x_i1) ->
                 let _x = o#name _x in
                 let _x_i1 = o#list (fun o -> o#fieldconstraint) _x_i1
                 in (_x, _x_i1))
              _x_i2 in
          let _x_i3 = o#phrase _x_i3 in
      let _x_i4 = o#phrase _x_i4 in TableLit ((_x, (y, z), _x_i2, _x_i3, _x_i4))
      | LensLit ((_x, _x_i1)) ->
              let _x = o#phrase _x in
              let _x_i1 = o#option (fun o -> o#unknown) _x_i1 in
              LensLit (_x, _x_i1)
      | LensKeysLit ((_x, _x_i1, _x_i2)) ->
              let _x = o#phrase _x in
              let _x_i1 = o#phrase _x_i1 in
              let _x_i2 = o#option (fun o -> o#unknown) _x_i2 in
              LensKeysLit (_x, _x_i1, _x_i2)
      | LensFunDepsLit ((_x, _x_i1, _x_i2)) ->
              let _x = o#phrase _x in
              let _x_i2 = o#option (fun o -> o#unknown) _x_i2 in
              LensFunDepsLit (_x, _x_i1, _x_i2)
      | LensDropLit ((_x, _x_i1, _x_i2, _x_i3, _x_i4)) ->
          let _x = o#phrase _x in
          let _x_i1 = o#string _x_i1 in
          let _x_i2 = o#string _x_i2 in
          let _x_i3 = o#phrase _x_i3 in
          let _x_i4 = o#option (fun o -> o#unknown) _x_i4 in
          LensDropLit((_x, _x_i1, _x_i2, _x_i3, _x_i4))
      | LensSelectLit ((_x, _x_i1, _x_i2)) ->
          let _x = o#phrase _x in
          let _x_i1 = o#phrase _x_i1 in
          let _x_i2 = o#option (fun o -> o#unknown) _x_i2 in
          LensSelectLit ((_x, _x_i1, _x_i2))
      | LensJoinLit ((_x, _x_i1, _x_i2, _x_i3, _x_i4, _x_i5)) ->
          let _x = o#phrase _x in
          let _x_i1 = o#phrase _x_i1 in
          let _x_i2 = o#phrase _x_i2 in
          (* _x_i3 and _x_i4 are both phrases which are left unchanged *)
          let _x_i5 = o#option (fun o -> o#unknown) _x_i5 in
          LensJoinLit ((_x, _x_i1, _x_i2, _x_i3, _x_i4, _x_i5))
      | LensCheckLit ((_x, _x_i1)) ->
          let _x = o#phrase _x in
          let _x_i1 = o#option (fun o -> o#unknown) _x_i1 in
          LensCheckLit ((_x, _x_i1))
      | LensGetLit ((_x, _x_i1)) ->
          let _x = o#phrase _x in
          let _x_i1 = o#option (fun o -> o#unknown) _x_i1 in
            LensGetLit ((_x, _x_i1))
      | LensPutLit ((_x, _x_i1, _x_i2)) ->
          let _x = o#phrase _x in
          let _x_i1 = o#phrase _x_i1 in
          let _x_i2 = o#option (fun o -> o#unknown) _x_i2 in
            LensPutLit ((_x, _x_i1, _x_i2))
      | DBDelete ((_x, _x_i1, _x_i2)) ->
          let _x = o#pattern _x in
          let _x_i1 = o#phrase _x_i1 in
          let _x_i2 = o#option (fun o -> o#phrase) _x_i2
          in DBDelete ((_x, _x_i1, _x_i2))
      | DBInsert ((_x, _x_i1, _x_i2, _x_i3)) ->
          let _x = o#phrase _x in
          let _x_i1 = o#list (fun o -> o#name) _x_i1 in
          let _x_i2 = o#phrase _x_i2 in
          let _x_i3 = o#option (fun o -> o#phrase) _x_i3 in DBInsert ((_x, _x_i1, _x_i2, _x_i3))
      | DBUpdate ((_x, _x_i1, _x_i2, _x_i3)) ->
          let _x = o#pattern _x in
          let _x_i1 = o#phrase _x_i1 in
          let _x_i2 = o#option (fun o -> o#phrase) _x_i2 in
          let _x_i3 =
            o#list
              (fun o (_x, _x_i1) ->
                 let _x = o#name _x in
                 let _x_i1 = o#phrase _x_i1 in (_x, _x_i1))
              _x_i3
          in DBUpdate ((_x, _x_i1, _x_i2, _x_i3))
      | Xml ((_x, _x_i1, _x_i2, _x_i3)) ->
          let _x = o#name _x in
          let _x_i1 =
            o#list
              (fun o (_x, _x_i1) ->
                 let _x = o#name _x in
                 let _x_i1 = o#list (fun o -> o#phrase) _x_i1 in (_x, _x_i1))
              _x_i1 in
          let _x_i2 = o#option (fun o -> o#phrase) _x_i2 in
          let _x_i3 = o#list (fun o -> o#phrase) _x_i3
          in Xml ((_x, _x_i1, _x_i2, _x_i3))
      | TextNode _x -> let _x = o#string _x in TextNode _x
      | Formlet ((_x, _x_i1)) ->
          let _x = o#phrase _x in
          let _x_i1 = o#phrase _x_i1 in Formlet ((_x, _x_i1))
      | Page _x -> let _x = o#phrase _x in Page _x
      | FormletPlacement ((_x, _x_i1, _x_i2)) ->
          let _x = o#phrase _x in
          let _x_i1 = o#phrase _x_i1 in
          let _x_i2 = o#phrase _x_i2
          in FormletPlacement ((_x, _x_i1, _x_i2))
      | PagePlacement _x -> let _x = o#phrase _x in PagePlacement _x
      | FormBinding ((_x, _x_i1)) ->
          let _x = o#phrase _x in
          let _x_i1 = o#pattern _x_i1 in FormBinding ((_x, _x_i1))
      | TryInOtherwise (_p1, _pat, _p2, _p3, _ty) ->
          let _p1 = o#phrase _p1 in
          let _pat = o#pattern _pat in
          let _p2 = o#phrase _p2 in
          let _p3 = o#phrase _p3 in
          TryInOtherwise (_p1, _pat, _p2, _p3, _ty)
      | Raise -> Raise


    method phrase : phrase -> phrase =
      fun p ->
        WithPos.map2 ~f_pos:o#position ~f_node:o#phrasenode p

    method cp_phrasenode : cp_phrasenode -> cp_phrasenode =
      function
      | CPUnquote (bs, e)  -> CPUnquote (o#list (fun o -> o#binding) bs, o#phrase e)
      | CPGrab (c, x, p)   -> CPGrab (c, x, o#cp_phrase p)
      | CPGive (c, e, p)   -> CPGive (c, o#option (fun o -> o#phrase) e, o#cp_phrase p)
      | CPGiveNothing c    -> CPGiveNothing (o#binder c)
      | CPSelect (c, l, p) -> CPSelect (c, l, o#cp_phrase p)
      | CPOffer (c, bs)    -> CPOffer (c, o#list (fun o (l, p) -> (l, o#cp_phrase p)) bs)
      | CPLink (c, d)      -> CPLink (c, d)
      | CPComp (c, p, q)   -> CPComp (c, o#cp_phrase p, o#cp_phrase q)

    method cp_phrase : cp_phrase -> cp_phrase =
      fun p ->
      WithPos.map2 ~f_pos:o#position ~f_node:o#cp_phrasenode p

    method patternnode : Pattern.t -> Pattern.t =
      let open Pattern in
      function
      | Any -> Any
      | Nil -> Nil
      | Cons ((_x, _x_i1)) ->
          let _x = o#pattern _x in
          let _x_i1 = o#pattern _x_i1 in Cons ((_x, _x_i1))
      | List _x -> let _x = o#list (fun o -> o#pattern) _x in List _x
      | Variant ((_x, _x_i1)) ->
          let _x = o#name _x in
          let _x_i1 = o#option (fun o -> o#pattern) _x_i1
          in Variant ((_x, _x_i1))
      | Effect (name, ps, k) ->
         let name = o#name name in
         let ps = o#list (fun o -> o#pattern) ps in
         let k  = o#pattern k in
         Effect (name, ps, k)
      | Negative _x ->
          let _x = o#list (fun o -> o#name) _x
          in Negative _x
      | Record ((_x, _x_i1)) ->
          let _x =
            o#list
              (fun o (_x, _x_i1) ->
                 let _x = o#name _x in
                 let _x_i1 = o#pattern _x_i1 in (_x, _x_i1))
              _x in
          let _x_i1 = o#option (fun o -> o#pattern) _x_i1
          in Record ((_x, _x_i1))
      | Tuple _x -> let _x = o#list (fun o -> o#pattern) _x in Tuple _x
      | Constant _x -> let _x = o#constant _x in Constant _x
      | Variable _x -> let _x = o#binder _x in Variable _x
      | As ((_x, _x_i1)) ->
          let _x = o#binder _x in
          let _x_i1 = o#pattern _x_i1 in As ((_x, _x_i1))
      | HasType ((_x, _x_i1)) ->
          let _x = o#pattern _x in
          let _x_i1 = o#datatype' _x_i1 in HasType ((_x, _x_i1))

    method pattern : Pattern.with_pos -> Pattern.with_pos =
      fun p ->
        WithPos.map2 ~f_pos:o#position ~f_node:o#patternnode p

    method name : name -> name = o#string

    method location : Location.t -> Location.t = o#unknown

    method iterpatt : iterpatt -> iterpatt =
      function
      | List ((_x, _x_i1)) ->
          let _x = o#pattern _x in
          let _x_i1 = o#phrase _x_i1 in List ((_x, _x_i1))
      | Table ((_x, _x_i1)) ->
          let _x = o#pattern _x in
          let _x_i1 = o#phrase _x_i1 in Table ((_x, _x_i1))

    method funlit : funlit -> funlit =
      fun (_x, _x_i1) ->
        let _x = o#list (fun o -> o#list (fun o -> o#pattern)) _x in
        let _x_i1 = o#phrase _x_i1 in (_x, _x_i1)

    method handle_params : handler_parameterisation -> handler_parameterisation =
      fun params ->
      let bindings =
        o#list
          (fun o (pat, expr) ->
            let expr = o#phrase expr in
            let pat = o#pattern pat in
            (pat, expr))
          params.shp_bindings
      in
      { params with shp_bindings = bindings }

    method fieldspec : Datatype.fieldspec -> Datatype.fieldspec =
      let open Datatype in function
      | Present _x -> let _x = o#datatype _x in Present _x
      | Absent -> Absent
      | Var _x -> let _x = o#known_type_variable _x in Var _x

    method fieldconstraint : fieldconstraint -> fieldconstraint =
      fun fc -> fc

    method directive : directive -> directive =
      fun (_x, _x_i1) ->
        let _x = o#string _x in
        let _x_i1 = o#list (fun o -> o#string) _x_i1 in (_x, _x_i1)

    method datatypenode : Datatype.t -> Datatype.t =
      let open Datatype in
      function
      | TypeVar _x ->
          let _x = o#known_type_variable _x in TypeVar _x
      | QualifiedTypeApplication (ns, args) ->
          let ns = o#list (fun o -> o#name) ns in
          let args = o#list (fun o -> o#type_arg) args in
          QualifiedTypeApplication (ns, args)
      | Function (_x, _x_i1, _x_i2) ->
          let _x = o#list (fun o -> o#datatype) _x in
          let _x_i1 = o#row _x_i1 in
          let _x_i2 = o#datatype _x_i2 in Function (_x, _x_i1, _x_i2)
      | Lolli (_x, _x_i1, _x_i2) ->
          let _x = o#list (fun o -> o#datatype) _x in
          let _x_i1 = o#row _x_i1 in
          let _x_i2 = o#datatype _x_i2 in Lolli (_x, _x_i1, _x_i2)
      | Mu (_x, _x_i1) ->
          let _x = o#name _x in
          let _x_i1 = o#datatype _x_i1 in Mu (_x, _x_i1)
      | Forall (_x, _x_i1) ->
          let _x_i1 = o#datatype _x_i1 in Forall (_x, _x_i1)
      | Unit -> Unit
      | Tuple _x ->
          let _x = o#list (fun o -> o#datatype) _x in Tuple _x
      | Record _x -> let _x = o#row _x in Record _x
      | Variant _x -> let _x = o#row _x in Variant _x
      | Effect r -> let r = o#row r in Effect r
      | Table (_x, _x_i1, _x_i2) ->
         let _x = o#datatype _x in
         let _x_i1 = o#datatype _x_i1 in
         let _x_i2 = o#datatype _x_i2 in Table (_x, _x_i1, _x_i2)
      | List _x -> let _x = o#datatype _x in List _x
      | TypeApplication (_x, _x_i1) ->
          let _x = o#name _x in
          let _x_i1 = o#list (fun o -> o#type_arg) _x_i1
          in TypeApplication (_x, _x_i1)
      | Primitive _x -> let _x = o#unknown _x in Primitive _x
      | DB -> DB
      | Input (_x, _x_i1) ->
        let _x = o#datatype _x in
        let _x_i1 = o#datatype _x_i1 in Input (_x, _x_i1)
      | Output (_x, _x_i1) ->
        let _x = o#datatype _x in
        let _x_i1 = o#datatype _x_i1 in Output (_x, _x_i1)
      | Select _x ->
        let _x = o#row _x in Select _x
      | Choice _x ->
        let _x = o#row _x in Choice _x
      | Dual _x ->
        let _x = o#datatype _x in Dual _x
      | End -> End

    method datatype : Datatype.with_pos -> Datatype.with_pos =
        WithPos.map2 ~f_pos:o#position ~f_node:o#datatypenode

    method type_arg : Datatype.type_arg -> Datatype.type_arg =
      let open Datatype in function
      | Type _x -> let _x = o#datatype _x in Type _x
      | Row _x -> let _x = o#row _x in Row _x
      | Presence _x -> let _x = o#fieldspec _x in Presence _x

    method constant : Constant.t -> Constant.t =
      function
      | Constant.Float _x  -> let _x = o#float _x  in Constant.Float _x
      | Constant.Int _x    -> let _x = o#int _x    in Constant.Int _x
      | Constant.String _x -> let _x = o#string _x in Constant.String _x
      | Constant.Bool _x   -> let _x = o#bool _x   in Constant.Bool _x
      | Constant.Char _x   -> let _x = o#char _x   in Constant.Char _x

    method binop : BinaryOp.t -> BinaryOp.t =
      let open BinaryOp in function
      | Minus -> Minus
      | FloatMinus -> FloatMinus
      | RegexMatch _x ->
          let _x = o#list (fun o -> o#regexflag) _x in RegexMatch _x
      | And -> And
      | Or -> Or
      | Cons -> Cons
      | Name _x -> let _x = o#name _x in Name _x

    method tybinop : tyarg list * BinaryOp.t -> tyarg list * BinaryOp.t =
      fun (_x, _x_i1) -> (_x, o#binop _x_i1)

    method bindingnode : bindingnode -> bindingnode =
      function
      | Val ((_x, (_x_i1, _x_i2), _x_i3, _x_i4)) ->
          let _x    = o#pattern _x in
          let _x_i2 = o#phrase _x_i2 in
          let _x_i3 = o#location _x_i3 in
          let _x_i4 = o#option (fun o -> o#datatype') _x_i4
          in Val ((_x, (_x_i1, _x_i2), _x_i3, _x_i4))
      | Fun f -> Fun (o#function_definition f)
      | Funs _x ->
          let _x = o#list (fun o -> o#recursive_function) _x in
          Funs _x
      | Foreign ((_x, _x_i1, _x_i2, _x_i3, _x_i4)) ->
          let _x = o#binder _x in
          let _x_i1 = o#name _x_i1 in
          let _x_i2 = o#name _x_i2 in
          let _x_i3 = o#name _x_i3 in
          let _x_i4 = o#datatype' _x_i4 in
          Foreign ((_x, _x_i1, _x_i2, _x_i3, _x_i4))
      | Import { pollute; path } ->
         Import { pollute; path = o#list (fun o -> o#name) path }
      | Open _xs ->
          let _xs = o#list (fun o -> o#name) _xs in
          Open _xs
      | Typenames (ts) ->
          let ts = o#list (fun o (_x, _x_i1, _x_i2, _x_i3) ->
            let _x = o#name _x in
            let _x_i1 =
              o#list
                (fun o (_x, _x_i1) ->
                   let _x = _x (*o#quantifier _x*) in
                   let _x_i1 = o#unknown _x_i1
                   in (_x, _x_i1))
                _x_i1
            in let _x_i2 = o#datatype' _x_i2 in (_x, _x_i1, _x_i2, _x_i3)
          ) ts in
          Typenames ts
      | Infix -> Infix
      | Exp _x -> let _x = o#phrase _x in Exp _x
      | Module { binder; members } ->
          let binder = o#binder binder in
          let members = o#list (fun o -> o#binding) members in
          Module { binder; members }
      | AlienBlock (lang, lib, dts) ->
          let lang = o#name lang in
          let lib = o#name lib in
          let dts = o#list (fun o (b, dt) ->
            let b = o#binder b in
            let dt = o#datatype' dt in
            (b, dt)) dts in
          AlienBlock (lang, lib, dts)

    method binding : binding -> binding =
      fun p ->
        WithPos.map2 ~f_pos:o#position ~f_node:o#bindingnode p

    method function_definition : function_definition -> function_definition
      = fun { fun_binder = a;
              fun_linearity = b;
              fun_definition = (c, d);
              fun_location = e;
              fun_signature = f;
              fun_unsafe_signature = g; } ->
      let a = o#binder a in
      let d = o#funlit d in
      let e = o#location e in
      let f = o#option (fun o -> o#datatype') f in
      { fun_binder = a;
        fun_linearity = b;
        fun_definition = (c, d);
        fun_location = e;
        fun_signature = f;
        fun_unsafe_signature = g; }

    method recursive_function  : recursive_function -> recursive_function
      = fun { rec_binder = a;
              rec_linearity = b;
              rec_definition = (c, d);
              rec_location = e;
              rec_signature = f;
              rec_unsafe_signature = g;
              rec_pos = h } ->
      let a = o#binder a in
      let d = o#funlit d in
      let e = o#location e in
      let f = o#option (fun o -> o#datatype') f in
      let h = o#position h in
      { rec_binder = a;
        rec_linearity = b;
        rec_definition = (c, d);
        rec_location = e;
        rec_signature = f;
        rec_unsafe_signature = g;
        rec_pos = h; }

    method program : program -> program =
      fun (bindings, phrase) ->
        let bindings = o#list (fun o -> o#binding) bindings in
        let phrase = o#option (fun o -> o#phrase) phrase in
          (bindings, phrase)

    method unknown : 'a. 'a -> 'a = fun x -> x
  end

class fold =
  object ((o : 'self_type))
    method string : string -> 'self_type = o#unknown

    method option :
      'a. ('self_type -> 'a -> 'self_type) -> 'a option -> 'self_type =
      fun _f_a -> function | None -> o | Some _x -> let o = _f_a o _x in o

    method list :
      'a. ('self_type -> 'a -> 'self_type) -> 'a list -> 'self_type =
      fun _f_a ->
        function
        | [] -> o
        | _x :: _x_i1 -> let o = _f_a o _x in let o = o#list _f_a _x_i1 in o

    method int : int -> 'self_type = o#unknown

    method float : float -> 'self_type = o#unknown

    method char : char -> 'self_type = o#unknown

    method bool : bool -> 'self_type = function | false -> o | true -> o

    method unary_op : UnaryOp.t -> 'self_type =
      let open UnaryOp in function
      | Minus -> o
      | FloatMinus -> o
      | Name _x -> let o = o#name _x in o

    method tyunary_op : tyarg list * UnaryOp.t -> 'self_type =
      fun (_x, _x_i1) -> o#unary_op _x_i1

    method binder : Binder.with_pos -> 'self_type =
      fun bndr ->
        let o = o#name (Binder.to_name bndr) in
        let o = o#position (WithPos.pos bndr) in o

    method sentence : sentence -> 'self_type =
      function
      | Definitions _x -> let o = o#list (fun o -> o#binding) _x in o
      | Expression _x -> let o = o#phrase _x in o
      | Directive _x -> let o = o#directive _x in o

    method section : Section.t -> 'self_type =
      let open Section in function
      | Minus -> o
      | FloatMinus -> o
      | Project _x -> let o = o#name _x in o
      | Name _x -> let o = o#name _x in o

    method subkind : subkind -> 'self_type = fun _ -> o

    method kind : kind -> 'self_type = fun _ -> o

    method freedom : freedom -> 'self_type = fun _ -> o

    method type_variable : type_variable -> 'self_type =
      fun (_x, _x_i1, _x_i2) ->
        let o = o#name _x in
        let o = o#kind _x_i1 in
        let o = o#freedom _x_i2 in o

    method known_type_variable : known_type_variable -> 'self_type =
      fun (_x, _x_i1, _x_i2) ->
        let o = o#name _x in
        let o = o#option (fun o -> o#subkind) _x_i1 in
        let o = o#freedom _x_i2 in o

    method row_var : Datatype.row_var -> 'self_type =
      let open Datatype in function
      | Closed -> o
      | Open _x ->
          let o = o#known_type_variable _x in o
      | Recursive ((_x, _x_i1)) ->
          let o = o#name _x in let o = o#row _x_i1 in o

    method row : Datatype.row -> 'self_type =
      fun (_x, _x_i1) ->
        let o =
          o#list
            (fun o (_x, _x_i1) ->
               let o = o#name _x in let o = o#fieldspec _x_i1 in o)
            _x in
        let o = o#row_var _x_i1 in o

    method replace_rhs : replace_rhs -> 'self_type =
      function
      | Literal    _x -> let o = o#string _x in o
      | SpliceExpr _x -> let o = o#phrase _x in o

    method regexflag : regexflag -> 'self_type =
      fun _ -> o

    method regex : regex -> 'self_type =
      function
      | Range ((_x, _x_i1)) ->
          let o = o#char _x in let o = o#char _x_i1 in o
      | Simply _x -> let o = o#string _x in o
      | Quote _x -> let o = o#regex _x in o
      | Any -> o
      | StartAnchor -> o
      | EndAnchor -> o
      | Seq _x -> let o = o#list (fun o -> o#regex) _x in o
      | Alternate ((_x, _x_i1)) ->
          let o = o#regex _x in let o = o#regex _x_i1 in o
      | Group _x -> let o = o#regex _x in o
      | Repeat ((_x, _x_i1)) ->
          let o = o#unknown _x in let o = o#regex _x_i1 in o
      | Splice _x -> let o = o#phrase _x in o
      | Replace ((_x, _x_i1)) ->
          let o = o#regex _x in let o = o#replace_rhs _x_i1 in o

    method position : Position.t -> 'self_type =
      Position.traverse
        ~o
        ~f_start:(fun o v -> o#unknown v)
        ~f_finish:(fun o v -> o#unknown v)
        ~f_code:(fun o v -> o#unknown v)

    method datatype' : datatype' -> 'self_type =
      fun (x, y) ->
        let o = o#datatype x in
        let o = o#unknown y in
          o

    method given_spawn_location : given_spawn_location -> 'self_type = function
      | ExplicitSpawnLocation p -> let o = o#phrase p in o
      | _ -> o

    method phrasenode : phrasenode -> 'self_type =
      function
      | Constant _x -> let o = o#constant _x in o
      | Var _x -> let o = o#name _x in o
      | FreezeVar _x -> let o = o#name _x in o
      | QualifiedVar _xs ->
          let o = o#list (fun o -> o#name) _xs in o
      | FunLit (_x, _x1, _x_i1, _x_i2) -> let o = o#funlit _x_i1 in let _x_i2 = o#location _x_i2 in o
      | Spawn (_spawn_kind, _given_spawn_location, _block_phr, _dt) ->
         let o = o#given_spawn_location _given_spawn_location in
         let o = o#phrase _block_phr in
         o
      | Query (_x, _x_i1, _x_i2) ->
          let o =
            o#option
              (fun o (_x, _x_i1) ->
                 let o = o#phrase _x in
                 let o = o#phrase _x_i1 in o)
              _x in
          let o = o#phrase _x_i1 in o
      | ListLit (_x, _x_i1) -> let o = o#list (fun o -> o#phrase) _x in o
      | Iteration ((_x, _x_i1, _x_i2, _x_i3)) ->
          let o = o#list (fun o -> o#iterpatt) _x in
          let o = o#phrase _x_i1 in
          let o = o#option (fun o -> o#phrase) _x_i2 in
          let o = o#option (fun o -> o#phrase) _x_i3 in o
      | Escape ((_x, _x_i1)) ->
          let o = o#binder _x in let o = o#phrase _x_i1 in o
      | Section _x -> let o = o#section _x in o
      | Conditional ((_x, _x_i1, _x_i2)) ->
          let o = o#phrase _x in
          let o = o#phrase _x_i1 in let o = o#phrase _x_i2 in o
      | Block ((_x, _x_i1)) ->
          let o = o#list (fun o -> o#binding) _x in
          let o = o#phrase _x_i1 in o
      | InfixAppl ((_x, _x_i1, _x_i2)) ->
          let o = o#tybinop _x in
          let o = o#phrase _x_i1 in let o = o#phrase _x_i2 in o
      | RangeLit ((_x_i1, _x_i2)) ->
          let o = o#phrase _x_i1 in let o = o#phrase _x_i2 in o
      | Regex _x -> let o = o#regex _x in o
      | UnaryAppl ((_x, _x_i1)) ->
          let o = o#tyunary_op _x in let o = o#phrase _x_i1 in o
      | FnAppl ((_x, _x_i1)) ->
          let o = o#phrase _x in
          let o = o#list (fun o -> o#phrase) _x_i1 in o
      | TAbstr ((_x, _x_i1)) ->
          let o = o#list (fun o -> o#tyvar) (_x) in
          let o = o#phrase _x_i1 in o
      | TAppl ((_x, _x_i1)) ->
          let o = o#phrase _x in o
      | TupleLit _x -> let o = o#list (fun o -> o#phrase) _x in o
      | RecordLit ((_x, _x_i1)) ->
          let o =
            o#list
              (fun o (_x, _x_i1) ->
                 let o = o#name _x in let o = o#phrase _x_i1 in o)
              _x in
          let o = o#option (fun o -> o#phrase) _x_i1 in o
      | Projection ((_x, _x_i1)) ->
          let o = o#phrase _x in let o = o#name _x_i1 in o
      | With ((_x, _x_i1)) ->
          let o = o#phrase _x in
          let o =
            o#list
              (fun o (_x, _x_i1) ->
                 let o = o#name _x in let o = o#phrase _x_i1 in o)
              _x_i1
          in o
      | TypeAnnotation ((_x, _x_i1)) ->
          let o = o#phrase _x in let o = o#datatype' _x_i1 in o
      | Instantiate _x -> o#phrase _x
      | Generalise _x -> o#phrase _x
      | Upcast ((_x, _x_i1, _x_i2)) ->
          let o = o#phrase _x in
          let o = o#datatype' _x_i1 in let o = o#datatype' _x_i2 in o
      | ConstructorLit ((_x, _x_i1, _x_i2)) ->
          let o = o#name _x in
          let o = o#option (fun o -> o#phrase) _x_i1 in o
      | DoOperation (name,ps,t) ->
         let o = o#name name in
     let o = o#option (fun o -> o#unknown) t in
     let o = o#list (fun o -> o#phrase) ps in o
      | Handle { sh_expr; sh_effect_cases; sh_value_cases; sh_descr } ->
         let o = o#phrase sh_expr in
         let o =
           o#option (fun o -> o#handle_params) sh_descr.shd_params
         in
         let o =
           o#list
             (fun o (lhs, rhs) ->
               let o = o#pattern lhs in
           let o = o#phrase rhs in o
         )
             sh_effect_cases
     in
         let o =
           o#list
             (fun o (lhs, rhs) ->
               let o = o#pattern lhs in
           let o = o#phrase rhs in o
         )
             sh_value_cases
     in o
      | Switch ((_x, _x_i1, _x_i2)) ->
          let o = o#phrase _x in
          let o =
            o#list
              (fun o (_x, _x_i1) ->
                 let o = o#pattern _x in let o = o#phrase _x_i1 in o)
              _x_i1 in
          let o = o#option (fun o -> o#unknown) _x_i2
          in o
      | Receive ((_x, _x_i1)) ->
          let o =
            o#list
              (fun o (_x, _x_i1) ->
                 let o = o#pattern _x in let o = o#phrase _x_i1 in o)
              _x in
          let o = o#option (fun o -> o#unknown) _x_i1
          in o
      (* | Link ((_x, _x_i1)) -> *)
      (*     let o = o#phrase _x in *)
      (*     let o = o#phrase _x_i1 *)
      (*     in o *)
      | Select ((_x, _x_i1)) ->
          let o = o#name _x in
          let o = o#phrase _x_i1
          in o
      | Offer ((_x, _x_i1, _x_i2)) ->
          let o = o#phrase _x in
          let o =
            o#list
              (fun o (_x, _x_i1) ->
                 let o = o#pattern _x in let o = o#phrase _x_i1 in o)
              _x_i1 in
          let o = o#option (fun o -> o#unknown) _x_i2
          in o
      | CP p -> o#cp_phrase p
      | DatabaseLit ((_x, _x_i1)) ->
          let o = o#phrase _x in
          let o =
            (fun (_x, _x_i1) ->
               let o = o#option (fun o -> o#phrase) _x in
               let o = o#option (fun o -> o#phrase) _x_i1 in o)
              _x_i1
          in o
      | TableLit ((_x, (y,z), _x_i2, _x_i3, _x_i4)) ->
          let o = o#phrase _x in
          let o = o#datatype y in
          let o = o#option
            (fun o r ->
               let o = o#unknown r in
                 o) z in
          let o =
            o#list
              (fun o (_x, _x_i1) ->
                 let o = o#name _x in
                 let o = o#list (fun o -> o#fieldconstraint) _x_i1 in o)
              _x_i2 in
          let o = o#phrase _x_i3 in
      let o = o#phrase _x_i4 in
        o
      | LensLit ((_x, _x_i1)) ->
          let o = o#phrase _x in
          let o = o#option (fun o -> o#unknown) _x_i1 in
            o
      | LensKeysLit ((_x, _x_i1, _x_i2)) ->
          let o = o#phrase _x in
          let o = o#phrase _x_i1 in
          let o = o#option (fun o -> o#unknown) _x_i2 in
            o
      | LensFunDepsLit ((_x, _x_i1, _x_i2)) ->
          let o = o#phrase _x in
          let o = o#option (fun o -> o#unknown) _x_i2 in
            o
      | LensDropLit ((_x, _x_i1, _x_i2, _x_i3, _x_i4)) ->
          let o = o#phrase _x in
          let o = o#string _x_i1 in
          let o = o#string _x_i2 in
          let o = o#phrase _x_i3 in
          let o = o#option (fun o -> o#unknown) _x_i4 in
            o
      | LensSelectLit ((_x, _x_i1, _x_i2)) ->
          let o = o#phrase _x in
          let o = o#phrase _x_i1 in
          let o = o#option (fun o -> o#unknown) _x_i2 in
            o
      | LensJoinLit ((_x, _x_i1, _x_i2, _x_i3, _x_i4, _x_i5)) ->
          let o = o#phrase _x in
          let o = o#phrase _x_i1 in
          let o = o#phrase _x_i2 in
          let o = o#option (fun o -> o#unknown) _x_i5 in
            o
      | LensCheckLit ((_x, _x_i1)) ->
          let o = o#phrase _x in
          let o = o#option (fun o -> o#unknown) _x_i1 in
            o
      | LensGetLit ((_x, _x_i1)) ->
          let o = o#phrase _x in
          let o = o#option (fun o -> o#unknown) _x_i1 in
            o
      | LensPutLit ((_x, _x_i1, _x_i2)) ->
          let o = o#phrase _x in
          let o = o#phrase _x_i1 in
          let o = o#option (fun o -> o#unknown) _x_i2 in
            o
      | DBDelete ((_x, _x_i1, _x_i2)) ->
          let o = o#pattern _x in
          let o = o#phrase _x_i1 in
          let o = o#option (fun o -> o#phrase) _x_i2 in o
      | DBInsert ((_x, _x_i1, _x_i2, _x_i3)) ->
          let o = o#phrase _x in
          let o = o#list (fun o -> o#name) _x_i1 in
          let o = o#phrase _x_i2 in let o = o#option (fun o -> o#phrase) _x_i3 in o
      | DBUpdate ((_x, _x_i1, _x_i2, _x_i3)) ->
          let o = o#pattern _x in
          let o = o#phrase _x_i1 in
          let o = o#option (fun o -> o#phrase) _x_i2 in
          let o =
            o#list
              (fun o (_x, _x_i1) ->
                 let o = o#name _x in let o = o#phrase _x_i1 in o)
              _x_i3
          in o
      | Xml ((_x, _x_i1, _x_i2, _x_i3)) ->
          let o = o#name _x in
          let o =
            o#list
              (fun o (_x, _x_i1) ->
                 let o = o#name _x in
                 let o = o#list (fun o -> o#phrase) _x_i1 in o)
              _x_i1 in
          let o = o#option (fun o -> o#phrase) _x_i2 in
          let o = o#list (fun o -> o#phrase) _x_i3 in o
      | TextNode _x -> let o = o#string _x in o
      | Formlet ((_x, _x_i1)) ->
          let o = o#phrase _x in let o = o#phrase _x_i1 in o
      | Page _x -> let o = o#phrase _x in o
      | FormletPlacement ((_x, _x_i1, _x_i2)) ->
          let o = o#phrase _x in
          let o = o#phrase _x_i1 in let o = o#phrase _x_i2 in o
      | PagePlacement _x -> let o = o#phrase _x in o
      | FormBinding ((_x, _x_i1)) ->
          let o = o#phrase _x in let o = o#pattern _x_i1 in o
      | TryInOtherwise (_p1, _pat, _p2, _p3, _ty) ->
          let o = o#phrase _p1 in
          let o = o#pattern _pat in
          let o = o#phrase _p2 in
          let o = o#phrase _p3 in
          o
      | Raise -> o

    method phrase : phrase -> 'self_type =
      WithPos.traverse
        ~o
        ~f_pos:(fun o v -> o#position v)
        ~f_node:(fun o v -> o#phrasenode v)

    method cp_phrasenode : cp_phrasenode -> 'self_type =
      function
      | CPUnquote (bs, e)    -> (o#list (fun o -> o#binding) bs)#phrase e
      | CPGrab (_c, _x, p)   -> o#cp_phrase p
      | CPGive (_c, e, p)    -> (o#option (fun o -> o#phrase) e)#cp_phrase p
      | CPGiveNothing c      -> o#binder c
      | CPSelect (_c, _l, p) -> o#cp_phrase p
      | CPOffer (_c, bs)     -> o#list (fun o (_l, b) -> o#cp_phrase b) bs
      | CPLink (_c, _d)      -> o
      | CPComp (_c, p, q)    -> (o#cp_phrase p)#cp_phrase q

    method cp_phrase : cp_phrase -> 'self_node =
      WithPos.traverse
        ~o
        ~f_pos:(fun o v -> o#position v)
        ~f_node:(fun o v -> o#cp_phrasenode v)

    method patternnode : Pattern.t -> 'self_type =
      let open Pattern in
      function
      | Any -> o
      | Nil -> o
      | Cons ((_x, _x_i1)) ->
          let o = o#pattern _x in let o = o#pattern _x_i1 in o
      | List _x -> let o = o#list (fun o -> o#pattern) _x in o
      | Variant ((_x, _x_i1)) ->
          let o = o#name _x in
          let o = o#option (fun o -> o#pattern) _x_i1 in o
      | Effect (name, ps, k) ->
         let o = o#name name in
         let o = o#list (fun o -> o#pattern) ps in
         let o = o#pattern k in
         o
      | Negative _x ->
          let o = o#list (fun o -> o#name) _x in o
      | Record ((_x, _x_i1)) ->
          let o =
            o#list
              (fun o (_x, _x_i1) ->
                 let o = o#name _x in let o = o#pattern _x_i1 in o)
              _x in
          let o = o#option (fun o -> o#pattern) _x_i1 in o
      | Tuple _x -> let o = o#list (fun o -> o#pattern) _x in o
      | Constant _x -> let o = o#constant _x in o
      | Variable _x -> let o = o#binder _x in o
      | As ((_x, _x_i1)) ->
          let o = o#binder _x in let o = o#pattern _x_i1 in o
      | HasType ((_x, _x_i1)) ->
          let o = o#pattern _x in let o = o#datatype' _x_i1 in o


    method pattern : Pattern.with_pos -> 'self_type =
      WithPos.traverse
        ~o
        ~f_pos:(fun o v -> o#position v)
        ~f_node:(fun o v -> o#patternnode v)

    method name : name -> 'self_type = o#string

    method location : Location.t -> 'self_type = o#unknown

    method iterpatt : iterpatt -> 'self_type =
      function
      | List ((_x, _x_i1)) ->
          let o = o#pattern _x in let o = o#phrase _x_i1 in o
      | Table ((_x, _x_i1)) ->
          let o = o#pattern _x in let o = o#phrase _x_i1 in o

    method funlit : funlit -> 'self_type =
      fun (_x, _x_i1) ->
        let o = o#list (fun o -> o#list (fun o -> o#pattern)) _x in
        let o = o#phrase _x_i1 in o

    method handle_params : handler_parameterisation -> 'self_type =
      fun params ->
        o#list
          (fun o (pat, expr) ->
            let o = o#phrase expr in
            o#pattern pat)
          params.shp_bindings

    method fieldspec : Datatype.fieldspec -> 'self_type =
      let open Datatype in function
      | Present _x -> let o = o#datatype _x in o
      | Absent -> o
      | Var _x -> let o = o#known_type_variable _x in o

    method fieldconstraint : fieldconstraint -> 'self_type =
      fun _ -> o

    method directive : directive -> 'self_type =
      fun (_x, _x_i1) ->
        let o = o#string _x in let o = o#list (fun o -> o#string) _x_i1 in o

    method tyvar : tyvar -> 'self_type = fun _ -> o

    method datatypenode : Datatype.t -> 'self_type =
      let open Datatype in
      function
      | TypeVar _x ->
          let o = o#known_type_variable _x in o
      | QualifiedTypeApplication (ns, args) ->
          let o = o#list (fun o -> o#name) ns in
          let o = o#list (fun o -> o#type_arg) args in
          o
      | Function (_x, _x_i1, _x_i2) ->
          let o = o#list (fun o -> o#datatype) _x in
          let o = o#row _x_i1 in let o = o#datatype _x_i2 in o
      | Lolli (_x, _x_i1, _x_i2) ->
          let o = o#list (fun o -> o#datatype) _x in
          let o = o#row _x_i1 in let o = o#datatype _x_i2 in o
      | Mu (_x, _x_i1) ->
          let o = o#name _x in let o = o#datatype _x_i1 in o
      | Forall (_x, _x_i1) ->
          let o = o#datatype _x_i1 in o
      | Unit -> o
      | Tuple _x -> let o = o#list (fun o -> o#datatype) _x in o
      | Record _x -> let o = o#row _x in o
      | Variant _x -> let o = o#row _x in o
      | Effect r -> let o = o#row r in o
      | Table (_x, _x_i1, _x_i2) ->
          let o = o#datatype _x in let o = o#datatype _x_i1 in let o = o#datatype _x_i2 in o
      | List _x -> let o = o#datatype _x in o
      | TypeApplication (_x, _x_i1) ->
          let o = o#name _x in
          let o = o#list (fun o -> o#type_arg) _x_i1 in o
      | Primitive _x -> let o = o#unknown _x in o
      | DB -> o
      | Input (_x, _x_i1) ->
        let o = o#datatype _x in
        let o = o#datatype _x_i1 in o
      | Output (_x, _x_i1) ->
        let o = o#datatype _x in
        let o = o#datatype _x_i1 in o
      | Select _x ->
        let o = o#row _x in o
      | Choice _x ->
        let o = o#row _x in o
      | Dual _x ->
        let o = o#datatype _x in o
      | End -> o

    method datatype : Datatype.with_pos -> 'self_type =
      WithPos.traverse
        ~o
        ~f_pos:(fun o v -> o#position v)
        ~f_node:(fun o v -> o#datatypenode v)

    method type_arg : Datatype.type_arg -> 'self_type =
      let open Datatype in function
      | Type _x -> let o = o#datatype _x in o
      | Row _x -> let o = o#row _x in o
      | Presence _x -> let o = o#fieldspec _x in o

    method constant : Constant.t -> 'self_type =
      function
      | Constant.Float  _x -> let o = o#float  _x in o
      | Constant.Int    _x -> let o = o#int    _x in o
      | Constant.String _x -> let o = o#string _x in o
      | Constant.Bool   _x -> let o = o#bool   _x in o
      | Constant.Char   _x -> let o = o#char   _x in o

    method binop : BinaryOp.t -> 'self_type =
      let open BinaryOp in function
      | Minus -> o
      | FloatMinus -> o
      | RegexMatch _x -> let o = o#list (fun o -> o#regexflag) _x in o
      | And -> o
      | Or -> o
      | Cons -> o
      | Name _x -> let o = o#name _x in o

    method tybinop : tyarg list * BinaryOp.t -> 'self_type =
      fun (_x, _x_i1) -> o#binop _x_i1

    method bindingnode : bindingnode -> 'self_type =
      function
      | Val ((_x, (_x_i1, _x_i2), _x_i3, _x_i4)) ->
          let o = o#pattern _x in
          let o = o#list (fun o -> o#tyvar) _x_i1 in
          let o = o#phrase _x_i2 in
          let o = o#location _x_i3 in
          let o = o#option (fun o -> o#datatype') _x_i4 in o
      | Fun f -> o#function_definition f
      | Funs _x ->
          let o = o#list (fun o -> o#recursive_function) _x in
          o
      | Foreign ((_x, _x_i1, _x_i2, _x_i3, _x_i4)) ->
          let o = o#binder _x in
          let o = o#name _x_i1 in
          let o = o#name _x_i2 in
          let o = o#name _x_i3 in
          let o = o#datatype' _x_i4 in o
      | Import { path; _ } ->
         let o = o#list (fun o -> o#name) path in
          o
      | Open _xs ->
          let o = o#list (fun o -> o#name) _xs in
          o
      | Typenames (ts) ->
          let o = o#list (fun o (_x, _x_i1, _x_i2, _x_i3) ->
            let o = o#name _x in
            let o =
              o#list
                (fun o (_x, _x_i1) ->
                   let o = o (* #quantifier _x*) in
                   let o = o#unknown _x_i1
                   in o) _x_i1
            in let o = o#datatype' _x_i2 in o) ts in
          o
      | Infix -> o
      | Exp _x -> let o = o#phrase _x in o
      | Module { binder; members } ->
          let o = o#binder binder in
          o#list (fun o -> o#binding) members
      | AlienBlock (lang, lib, dts) ->
          let o = o#name lang in
          let o = o#name lib in
          let o = o#list (fun o (b, dt)->
            let o = o#binder b in
            o#datatype' dt) dts in
          o

    method binding : binding -> 'self_type =
      WithPos.traverse
        ~o
        ~f_pos:(fun o v -> o#position v)
        ~f_node:(fun o v -> o#bindingnode v)

    method function_definition : function_definition -> 'self
      = fun { fun_binder = a;
              fun_linearity = _;
              fun_definition = (b, c);
              fun_location = d;
              fun_signature = e;
              fun_unsafe_signature = _ } ->
          let o = o#binder a in
          let o = o#list (fun o -> o#tyvar) b in
          let o = o#funlit c in
          let o = o#location d in
          let o = o#option (fun o -> o#datatype') e in
          o

    method recursive_function  : recursive_function -> 'self
      = fun { rec_binder = a;
              rec_linearity = _;
              rec_definition = ((b, _), c);
              rec_location = d;
              rec_signature = e;
              rec_unsafe_signature = _;
              rec_pos = g } ->
      let o = o#binder a in
      let o = o#list (fun o -> o#tyvar) b in
      let o = o#funlit c in
      let o = o#location d in
      let o = o#option (fun o -> o#datatype') e in
      let o = o#position g
      in o

    method program : program -> 'self_type =
      fun (bindings, phrase) ->
        let o = o#list (fun o -> o#binding) bindings in
        let o = o#option (fun o -> o#phrase) phrase in
        o

    method unknown : 'a. 'a -> 'self_type = fun _ -> o
  end

class virtual predicate =
object
  inherit fold
  method virtual satisfied : bool
end

class fold_map =
  object ((o : 'self_type))
    method string : string -> ('self_type * string) = o#unknown

    method option :
      'a.
        ('self_type -> 'a -> ('self_type * 'a)) ->
          'a option -> ('self_type * ('a option)) =
      fun _f_a ->
        function
        | None -> (o, None)
        | Some _x -> let (o, _x) = _f_a o _x in (o, (Some _x))

    method list :
      'a.
        ('self_type -> 'a -> ('self_type * 'a)) ->
          'a list -> ('self_type * ('a list)) =
      fun _f_a ->
        function
        | [] -> (o, [])
        | _x :: _x_i1 ->
            let (o, _x) = _f_a o _x in
            let (o, _x_i1) = o#list _f_a _x_i1 in (o, (_x :: _x_i1))

    method int : int -> ('self_type * int) = o#unknown

    method float : float -> ('self_type * float) = o#unknown

    method char : char -> ('self_type * char) = o#unknown

    method bool : bool -> ('self_type * bool) =
      function | false -> (o, false) | true -> (o, true)

    method unary_op : UnaryOp.t -> ('self_type * UnaryOp.t) =
      let open UnaryOp in function
      | Minus -> (o, Minus)
      | FloatMinus -> (o, FloatMinus)
      | Name _x -> let (o, _x) = o#name _x in (o, Name _x)

    method tyunary_op : tyarg list * UnaryOp.t -> 'self_type * (tyarg list * UnaryOp.t) =
      fun (_x, _x_i1) ->
        let (o, _x_i1) = o#unary_op _x_i1 in (o, (_x, _x_i1))

    method sentence : sentence -> ('self_type * sentence) =
      function
      | Definitions _x ->
          let (o, _x) = o#list (fun o -> o#binding) _x
          in (o, Definitions _x)
      | Expression _x -> let (o, _x) = o#phrase _x in (o, Expression _x)
      | Directive _x -> let (o, _x) = o#directive _x in (o, Directive _x)

    method section : Section.t -> ('self_type * Section.t) =
      let open Section in function
      | Minus -> (o, Minus)
      | FloatMinus -> (o, FloatMinus)
      | Project _x -> let (o, _x) = o#name _x in (o, Project _x)
      | Name _x -> let (o, _x) = o#name _x in (o, Name _x)

    method subkind : subkind -> ('self_type * subkind) = fun k -> (o, k)

    method kind : kind -> ('self_type * kind) = fun k -> (o, k)

    method freedom : freedom -> ('self_type * freedom) = fun k -> (o, k)

    method type_variable : type_variable -> ('self_type * type_variable) =
      fun (_x, _x_i1, _x_i2) ->
        let (o, _x) = o#name _x in
        let (o, _x_i1) = o#kind _x_i1 in
        let (o, _x_i2) = o#freedom _x_i2 in (o, (_x, _x_i1, _x_i2))

    method known_type_variable : known_type_variable -> ('self_type * known_type_variable) =
      fun (_x, _x_i1, _x_i2) ->
        let (o, _x) = o#name _x in
        let (o, _x_i1) = o#option (fun o -> o#subkind) _x_i1 in
        let (o, _x_i2) = o#freedom _x_i2 in (o, (_x, _x_i1, _x_i2))

    method row_var : Datatype.row_var -> ('self_type * Datatype.row_var) =
      let open Datatype in function
      | Closed -> (o, Closed)
      | Open _x ->
          let (o, _x) = o#known_type_variable _x in (o, (Open _x))
      | Recursive ((_x, _x_i1)) ->
          let (o, _x) = o#name _x in
          let (o, _x_i1) = o#row _x_i1 in (o, Recursive ((_x, _x_i1)))

    method row : Datatype.row -> ('self_type * Datatype.row) =
      fun (_x, _x_i1) ->
        let (o, _x) =
          o#list
            (fun o (_x, _x_i1) ->
               let (o, _x) = o#string _x in
               let (o, _x_i1) = o#fieldspec _x_i1 in (o, (_x, _x_i1)))
            _x in
        let (o, _x_i1) = o#row_var _x_i1 in (o, (_x, _x_i1))

    method replace_rhs : replace_rhs -> ('self_type * replace_rhs) =
      function
      | Literal    _x -> let (o, _x) = o#string _x in (o, (Literal _x))
      | SpliceExpr _x -> let (o, _x) = o#phrase _x in (o, (SpliceExpr _x))

    method regexflag : regexflag -> ('self_type * regexflag) =
      fun flag -> (o, flag)

    method regex : regex -> ('self_type * regex) =
      function
      | Range ((_x, _x_i1)) ->
          let (o, _x) = o#char _x in
          let (o, _x_i1) = o#char _x_i1 in (o, (Range ((_x, _x_i1))))
      | Simply _x -> let (o, _x) = o#string _x in (o, (Simply _x))
      | Quote _x -> let (o, _x) = o#regex _x in (o, (Quote _x))
      | Any -> (o, Any)
      | StartAnchor -> (o, StartAnchor)
      | EndAnchor -> (o, EndAnchor)
      | Seq _x ->
          let (o, _x) = o#list (fun o -> o#regex) _x in (o, (Seq _x))
      | Alternate ((_x, _x_i1)) ->
          let (o, _x) = o#regex _x in
          let (o, _x_i1) = o#regex _x_i1 in (o, (Alternate ((_x, _x_i1))))
      | Group _x -> let (o, _x) = o#regex _x in (o, (Group _x))
      | Repeat ((_x, _x_i1)) ->
          let (o, _x) = o#unknown _x in
          let (o, _x_i1) = o#regex _x_i1 in (o, (Repeat ((_x, _x_i1))))
      | Splice _x -> let (o, _x) = o#phrase _x in (o, (Splice _x))
      | Replace ((_x, _x_i1)) ->
          let (o, _x) = o#regex _x in
          let (o, _x_i1) = o#replace_rhs _x_i1
          in (o, (Replace ((_x, _x_i1))))

    method program : program -> ('self_type * program) =
      fun (_x, _x_i1) ->
        let (o, _x) = o#list (fun o -> o#binding) _x in
        let (o, _x_i1) = o#option (fun o -> o#phrase) _x_i1
        in (o, (_x, _x_i1))

    method position : Position.t -> ('self_type * Position.t) =
      Position.traverse_map
        ~o
        ~f_start:(fun o v -> o#unknown v)
        ~f_finish:(fun o v -> o#unknown v)
        ~f_code:(fun o v -> o#option (fun o -> o#unknown) v)

    method given_spawn_location : given_spawn_location -> ('self_type * given_spawn_location) = function
      | ExplicitSpawnLocation _p -> let (o, _p) = o#phrase _p in (o, ExplicitSpawnLocation _p)
      | l -> (o, l)

    method phrasenode : phrasenode -> ('self_type * phrasenode) =
      function
      | Constant _x -> let (o, _x) = o#constant _x in (o, (Constant _x))
      | Var _x -> let (o, _x) = o#name _x in (o, (Var _x))
      | FreezeVar _x -> let (o, _x) = o#name _x in (o, (FreezeVar _x))
      | QualifiedVar _xs ->
          let (o, _xs) = o#list (fun o n -> o#name n) _xs in
          (o, (QualifiedVar _xs))
      | FunLit (_x, _x1, _x_i1, _x_i2) ->
        let (o, _x_i1) = o#funlit _x_i1 in
        let (o, _x_i2) = o#location _x_i2 in (o, (FunLit (_x, _x1, _x_i1, _x_i2)))
      | Spawn (_spawn_kind, _given_spawn_location, _block_phr, _dt) ->
          let (o, _given_spawn_location) = o#given_spawn_location _given_spawn_location in
          let (o, _block_phr) = o#phrase _block_phr in
          (o, (Spawn (_spawn_kind, _given_spawn_location, _block_phr, _dt)))
      | Query (_x, _x_i1, _x_i2) ->
          let (o, _x) =
            o#option
              (fun o (_x, _x_i1) ->
                 let (o, _x) = o#phrase _x in
                 let (o, _x_i1) = o#phrase _x_i1 in (o, (_x, _x_i1)))
              _x in
          let (o, _x_i1) = o#phrase _x_i1 in (o, (Query (_x, _x_i1, _x_i2)))
      | ListLit (_x, _x_i1) ->
          let (o, _x) = o#list (fun o -> o#phrase) _x in (o, (ListLit (_x, _x_i1)))
      | RangeLit ((_x_i1, _x_i2)) ->
          let (o, _x_i1) = o#phrase _x_i1 in
          let (o, _x_i2) = o#phrase _x_i2
          in (o, (RangeLit ((_x_i1, _x_i2))))
      | Iteration ((_x, _x_i1, _x_i2, _x_i3)) ->
          let (o, _x) = o#list (fun o -> o#iterpatt) _x in
          let (o, _x_i1) = o#phrase _x_i1 in
          let (o, _x_i2) = o#option (fun o -> o#phrase) _x_i2 in
          let (o, _x_i3) = o#option (fun o -> o#phrase) _x_i3
          in (o, (Iteration ((_x, _x_i1, _x_i2, _x_i3))))
      | Escape ((_x, _x_i1)) ->
          let (o, _x) = o#binder _x in
          let (o, _x_i1) = o#phrase _x_i1 in (o, (Escape ((_x, _x_i1))))
      | Section _x -> let (o, _x) = o#section _x in (o, (Section _x))
      | Conditional ((_x, _x_i1, _x_i2)) ->
          let (o, _x) = o#phrase _x in
          let (o, _x_i1) = o#phrase _x_i1 in
          let (o, _x_i2) = o#phrase _x_i2
          in (o, (Conditional ((_x, _x_i1, _x_i2))))
      | Block ((_x, _x_i1)) ->
          let (o, _x) = o#list (fun o -> o#binding) _x in
          let (o, _x_i1) = o#phrase _x_i1 in (o, (Block ((_x, _x_i1))))
      | InfixAppl ((_x, _x_i1, _x_i2)) ->
          let (o, _x) = o#tybinop _x in
          let (o, _x_i1) = o#phrase _x_i1 in
          let (o, _x_i2) = o#phrase _x_i2
          in (o, (InfixAppl ((_x, _x_i1, _x_i2))))
      | Regex _x -> let (o, _x) = o#regex _x in (o, (Regex _x))
      | UnaryAppl ((_x, _x_i1)) ->
          let (o, _x) = o#tyunary_op _x in
          let (o, _x_i1) = o#phrase _x_i1 in (o, (UnaryAppl ((_x, _x_i1))))
      | FnAppl ((_x, _x_i1)) ->
          let (o, _x) = o#phrase _x in
          let (o, _x_i1) = o#list (fun o -> o#phrase) _x_i1
          in (o, (FnAppl ((_x, _x_i1))))
      | TAbstr ((_x, _x_i1)) ->
          let (o, _x_i1) = o#phrase _x_i1 in (o, (TAbstr ((_x, _x_i1))))
      | TAppl ((_x, _x_i1)) ->
          let (o, _x) = o#phrase _x in (o, (TAppl ((_x, _x_i1))))
      | TupleLit _x ->
          let (o, _x) = o#list (fun o -> o#phrase) _x in (o, (TupleLit _x))
      | RecordLit ((_x, _x_i1)) ->
          let (o, _x) =
            o#list
              (fun o (_x, _x_i1) ->
                 let (o, _x) = o#name _x in
                 let (o, _x_i1) = o#phrase _x_i1 in (o, (_x, _x_i1)))
              _x in
          let (o, _x_i1) = o#option (fun o -> o#phrase) _x_i1
          in (o, (RecordLit ((_x, _x_i1))))
      | Projection ((_x, _x_i1)) ->
          let (o, _x) = o#phrase _x in
          let (o, _x_i1) = o#name _x_i1 in (o, (Projection ((_x, _x_i1))))
      | With ((_x, _x_i1)) ->
          let (o, _x) = o#phrase _x in
          let (o, _x_i1) =
            o#list
              (fun o (_x, _x_i1) ->
                 let (o, _x) = o#name _x in
                 let (o, _x_i1) = o#phrase _x_i1 in (o, (_x, _x_i1)))
              _x_i1
          in (o, (With ((_x, _x_i1))))
      | TypeAnnotation ((_x, _x_i1)) ->
          let (o, _x) = o#phrase _x in
          let (o, _x_i1) = o#datatype' _x_i1
          in (o, (TypeAnnotation ((_x, _x_i1))))
      | Upcast ((_x, _x_i1, _x_i2)) ->
          let (o, _x) = o#phrase _x in
          let (o, _x_i1) = o#datatype' _x_i1 in
          let (o, _x_i2) = o#datatype' _x_i2
          in (o, (Upcast ((_x, _x_i1, _x_i2))))
      | Instantiate _x ->
          let (o, _x) = o#phrase _x in
          (o, Instantiate _x)
      | Generalise _x ->
          let (o, _x) = o#phrase _x in
          (o, Generalise _x)
      | ConstructorLit ((_x, _x_i1, _x_i2)) ->
          let (o, _x) = o#name _x in
          let (o, _x_i1) = o#option (fun o -> o#phrase) _x_i1
          in (o, (ConstructorLit ((_x, _x_i1, _x_i2))))
      | DoOperation (name, ps, t) ->
     let (o, t) = o#option (fun o -> o#unknown) t in
     let (o, ps) = o#list (fun o -> o#phrase) ps in
     (o, DoOperation (name, ps, t))
      | Handle { sh_expr; sh_effect_cases; sh_value_cases; sh_descr } ->
          let (o, m) = o#phrase sh_expr in
          let (o, params) =
            o#option (fun o -> o#handle_params) sh_descr.shd_params
          in
          let (o, eff_cases) =
            o#list
              (fun o (lhs, rhs) ->
                 let (o, lhs) = o#pattern lhs in
                 let (o, rhs) = o#phrase rhs in (o, (lhs, rhs))
          )
              sh_effect_cases
      in
          let (o, val_cases) =
            o#list
              (fun o (lhs, rhs) ->
                 let (o, lhs) = o#pattern lhs in
                 let (o, rhs) = o#phrase rhs in (o, (lhs, rhs))
          )
              sh_value_cases
      in
          (o, (Handle { sh_expr = m; sh_effect_cases = eff_cases; sh_value_cases = val_cases; sh_descr = { sh_descr with shd_params = params } }))
      | Switch ((_x, _x_i1, _x_i2)) ->
          let (o, _x) = o#phrase _x in
          let (o, _x_i1) =
            o#list
              (fun o (_x, _x_i1) ->
                 let (o, _x) = o#pattern _x in
                 let (o, _x_i1) = o#phrase _x_i1 in (o, (_x, _x_i1)))
              _x_i1 in
          let (o, _x_i2) = o#option (fun o -> o#unknown) _x_i2
          in (o, (Switch ((_x, _x_i1, _x_i2))))
      | Receive ((_x, _x_i1)) ->
          let (o, _x) =
            o#list
              (fun o (_x, _x_i1) ->
                 let (o, _x) = o#pattern _x in
                 let (o, _x_i1) = o#phrase _x_i1 in (o, (_x, _x_i1)))
              _x in
          let (o, _x_i1) = o#option (fun o -> o#unknown) _x_i1
          in (o, (Receive ((_x, _x_i1))))
      (* | Link ((_x, _x_i1)) -> *)
      (*     let (o, _x) = o#phrase _x in *)
      (*     let (o, _x_i1) = o#phrase _x in (o, (Link(_x, _x_i1))) *)
      | Select ((_x, _x_i1)) ->
          let (o, _x) = o#name _x in
          let (o, _x_i1) = o#phrase _x_i1
          in (o, (Select (_x, _x_i1)))
      | Offer ((_x, _x_i1, _x_i2)) ->
          let (o, _x) = o#phrase _x in
          let (o, _x_i1) =
            o#list
              (fun o (_x, _x_i1) ->
                 let (o, _x) = o#pattern _x in
                 let (o, _x_i1) = o#phrase _x_i1 in (o, (_x, _x_i1)))
              _x_i1 in
          let (o, _x_i2) = o#option (fun o -> o#unknown) _x_i2
          in (o, (Offer ((_x, _x_i1, _x_i2))))
      | CP p ->
         let (o, p) = o#cp_phrase p in
         o, CP p
      | DatabaseLit ((_x, _x_i1)) ->
          let (o, _x) = o#phrase _x in
          let (o, _x_i1) =
            (fun (_x, _x_i1) ->
               let (o, _x) = o#option (fun o -> o#phrase) _x in
               let (o, _x_i1) = o#option (fun o -> o#phrase) _x_i1
               in (o, (_x, _x_i1)))
              _x_i1
          in (o, (DatabaseLit ((_x, _x_i1))))
      | TableLit ((_x, _x_i1, _x_i2, _x_i3, _x_i4)) ->
          let (o, _x) = o#phrase _x in
          let (o, _x_i1) =
            (fun (_x, _x_i1) ->
               let (o, _x) = o#datatype _x in
               let (o, _x_i1) =
                 o#option
                   (fun o _x ->
                      let (o, _x) = o#unknown _x in (o, _x))
                   _x_i1
               in (o, (_x, _x_i1)))
              _x_i1 in
          let (o, _x_i2) =
            o#list
              (fun o (_x, _x_i1) ->
                 let (o, _x) = o#name _x in
                 let (o, _x_i1) = o#list (fun o -> o#fieldconstraint) _x_i1
                 in (o, (_x, _x_i1)))
              _x_i2 in
          let (o, _x_i3) = o#phrase _x_i3 in
          let (o, _x_i4) = o#phrase _x_i4
          in (o, (TableLit ((_x, _x_i1, _x_i2, _x_i3, _x_i4))))
      | LensLit ((_x, _x_i1)) ->
          let (o, _x) = o#phrase _x in
          let (o, _x_i1) = o#option (fun o -> o#unknown) _x_i1 in
            (o, (LensLit (_x, _x_i1)))
      | LensKeysLit ((_x, _x_i1, _x_i2)) ->
          let (o, _x) = o#phrase _x in
          let (o, _x_i1) = o#phrase _x_i1 in
          let (o, _x_i2) = o#option (fun o -> o#unknown) _x_i2 in
            (o, (LensKeysLit (_x, _x_i1, _x_i2)))
      | LensFunDepsLit ((_x, _x_i1, _x_i2)) ->
          let (o, _x) = o#phrase _x in
          let (o, _x_i2) = o#option (fun o -> o#unknown) _x_i2 in
            (o, (LensFunDepsLit (_x, _x_i1, _x_i2)))
      | LensDropLit ((_x, _x_i1, _x_i2, _x_i3, _x_i4)) ->
          let (o, _x) = o#phrase _x in
          let (o, _x_i1) = o#string _x_i1 in
          let (o, _x_i2) = o#string _x_i2 in
          let (o, _x_i3) = o#phrase _x_i3 in
          let (o, _x_i4) = o#option (fun o -> o#unknown) _x_i4 in
            (o, (LensDropLit ((_x, _x_i1, _x_i2, _x_i3, _x_i4))))
      | LensSelectLit ((_x, _x_i1, _x_i2)) ->
          let (o, _x) = o#phrase _x in
          let (o, _x_i1) = o#phrase _x_i1 in
          let (o, _x_i2) = o#option (fun o -> o#unknown) _x_i2 in
            (o, (LensSelectLit ((_x, _x_i1, _x_i2))))

      | LensJoinLit ((_x, _x_i1, _x_i2, _x_i3, _x_i4, _x_i5)) ->
          let (o, _x) = o#phrase _x in
          let (o, _x_i1) = o#phrase _x_i1 in
          let (o, _x_i2) = o#phrase _x_i2 in
          let (o, _x_i5) = o#option (fun o -> o#unknown) _x_i5 in
            (o, (LensJoinLit ((_x, _x_i1, _x_i2, _x_i3, _x_i4, _x_i5))))
      | LensCheckLit ((_x, _x_i1)) ->
          let (o, _x) = o#phrase _x in
          let (o, _x_i1) = o#option (fun o -> o#unknown) _x_i1 in
            (o, (LensCheckLit ((_x, _x_i1))))
      | LensGetLit ((_x, _x_i1)) ->
          let (o, _x) = o#phrase _x in
          let (o, _x_i1) = o#option (fun o -> o#unknown) _x_i1 in
            (o, (LensGetLit ((_x, _x_i1))))
      | LensPutLit ((_x, _x_i1, _x_i2)) ->
          let (o, _x) = o#phrase _x in
          let (o, _x_i1) = o#phrase _x_i1 in
          let (o, _x_i2) = o#option (fun o -> o#unknown) _x_i2 in
            (o, (LensPutLit ((_x, _x_i1, _x_i2))))
      | DBDelete ((_x, _x_i1, _x_i2)) ->
          let (o, _x) = o#pattern _x in
          let (o, _x_i1) = o#phrase _x_i1 in
          let (o, _x_i2) = o#option (fun o -> o#phrase) _x_i2
          in (o, (DBDelete ((_x, _x_i1, _x_i2))))
      | DBInsert ((_x, _x_i1, _x_i2, _x_i3)) ->
          let (o, _x) = o#phrase _x in
          let (o, _x_i1) = o#list (fun o -> o#name) _x_i1 in
          let (o, _x_i2) = o#phrase _x_i2 in
          let (o, _x_i3) = o#option (fun o -> o#phrase) _x_i3
          in (o, (DBInsert ((_x, _x_i1, _x_i2, _x_i3))))
      | DBUpdate ((_x, _x_i1, _x_i2, _x_i3)) ->
          let (o, _x) = o#pattern _x in
          let (o, _x_i1) = o#phrase _x_i1 in
          let (o, _x_i2) = o#option (fun o -> o#phrase) _x_i2 in
          let (o, _x_i3) =
            o#list
              (fun o (_x, _x_i1) ->
                 let (o, _x) = o#name _x in
                 let (o, _x_i1) = o#phrase _x_i1 in (o, (_x, _x_i1)))
              _x_i3
          in (o, (DBUpdate ((_x, _x_i1, _x_i2, _x_i3))))
      | Xml ((_x, _x_i1, _x_i2, _x_i3)) ->
          let (o, _x) = o#name _x in
          let (o, _x_i1) =
            o#list
              (fun o (_x, _x_i1) ->
                 let (o, _x) = o#name _x in
                 let (o, _x_i1) = o#list (fun o -> o#phrase) _x_i1
                 in (o, (_x, _x_i1)))
              _x_i1 in
          let (o, _x_i2) = o#option (fun o -> o#phrase) _x_i2 in
          let (o, _x_i3) = o#list (fun o -> o#phrase) _x_i3
          in (o, (Xml ((_x, _x_i1, _x_i2, _x_i3))))
      | TextNode _x -> let (o, _x) = o#string _x in (o, (TextNode _x))
      | Formlet ((_x, _x_i1)) ->
          let (o, _x) = o#phrase _x in
          let (o, _x_i1) = o#phrase _x_i1 in (o, (Formlet ((_x, _x_i1))))
      | Page _x -> let (o, _x) = o#phrase _x in (o, (Page _x))
      | FormletPlacement ((_x, _x_i1, _x_i2)) ->
          let (o, _x) = o#phrase _x in
          let (o, _x_i1) = o#phrase _x_i1 in
          let (o, _x_i2) = o#phrase _x_i2
          in (o, (FormletPlacement ((_x, _x_i1, _x_i2))))
      | PagePlacement _x ->
          let (o, _x) = o#phrase _x in (o, (PagePlacement _x))
      | FormBinding ((_x, _x_i1)) ->
          let (o, _x) = o#phrase _x in
          let (o, _x_i1) = o#pattern _x_i1
          in (o, (FormBinding ((_x, _x_i1))))
      | TryInOtherwise (_p1, _pat, _p2, _p3, _ty) ->
          let (o, _p1) = o#phrase _p1 in
          let (o, _pat) = o#pattern _pat in
          let (o, _p2) = o#phrase _p2 in
          let (o, _p3) = o#phrase _p3 in
          (o, (TryInOtherwise (_p1, _pat, _p2, _p3, _ty)))
      | Raise -> (o, Raise)

    method phrase : phrase -> ('self_type * phrase) =
      WithPos.traverse_map
        ~o
        ~f_pos:(fun o v -> o#position v)
        ~f_node:(fun o v -> o#phrasenode v)

    method cp_phrasenode : cp_phrasenode -> ('self_type * cp_phrasenode) =
      function
      | CPUnquote (bs, e) ->
         let o, bs = o#list (fun o -> o#binding) bs in
         let o, e = o#phrase e in
         o, CPUnquote (bs, e)
      | CPGrab (c, x, p) ->
         let o, p = o#cp_phrase p in
         o, CPGrab (c, x, p)
      | CPGive (c, e, p) ->
         let o, e = o#option (fun o -> o#phrase) e in
         let o, p = o#cp_phrase p in
         o, CPGive (c, e, p)
      | CPGiveNothing c ->
         let o, c = o#binder c in
         o, CPGiveNothing c
      | CPSelect (c, l, p) ->
         let o, p = o#cp_phrase p in
         o, CPSelect (c, l, p)
      | CPOffer (c, bs) ->
         let o, bs = o#list (fun o (l, p) ->
                             let o, p = o#cp_phrase p in
                             o, (l, p)) bs in
         o, CPOffer (c, bs)
      | CPLink (c, d) ->
         o, CPLink (c, d)
      | CPComp (c, p, q) ->
         let o, p = o#cp_phrase p in
         let o, q = o#cp_phrase q in
         o, CPComp (c, p, q)

    method cp_phrase : cp_phrase -> ('self_type * cp_phrase) =
      WithPos.traverse_map
        ~o
        ~f_pos:(fun o v -> o#position v)
        ~f_node:(fun o v -> o#cp_phrasenode v)

    method patternnode : Pattern.t -> ('self_type * Pattern.t) =
      let open Pattern in
      function
      | Any -> (o, Any)
      | Nil -> (o, Nil)
      | Cons ((_x, _x_i1)) ->
          let (o, _x) = o#pattern _x in
          let (o, _x_i1) = o#pattern _x_i1 in (o, (Cons ((_x, _x_i1))))
      | List _x ->
          let (o, _x) = o#list (fun o -> o#pattern) _x in (o, (List _x))
      | Variant ((_x, _x_i1)) ->
          let (o, _x) = o#name _x in
          let (o, _x_i1) = o#option (fun o -> o#pattern) _x_i1
          in (o, (Variant ((_x, _x_i1))))
      | Effect (name, ps, k) ->
         let (o, name) = o#name name in
         let (o, ps) = o#list (fun o -> o#pattern) ps in
         let (o, k) = o#pattern k in
         (o, Effect (name, ps, k))
      | Negative _x ->
          let (o, _x) = o#list (fun o -> o#name) _x in (o, (Negative _x))
      | Record ((_x, _x_i1)) ->
          let (o, _x) =
            o#list
              (fun o (_x, _x_i1) ->
                 let (o, _x) = o#name _x in
                 let (o, _x_i1) = o#pattern _x_i1 in (o, (_x, _x_i1)))
              _x in
          let (o, _x_i1) = o#option (fun o -> o#pattern) _x_i1
          in (o, (Record ((_x, _x_i1))))
      | Tuple _x ->
          let (o, _x) = o#list (fun o -> o#pattern) _x in (o, (Tuple _x))
      | Constant _x -> let (o, _x) = o#constant _x in (o, (Constant _x))
      | Variable _x -> let (o, _x) = o#binder _x in (o, (Variable _x))
      | As ((_x, _x_i1)) ->
          let (o, _x) = o#binder _x in
          let (o, _x_i1) = o#pattern _x_i1 in (o, (As ((_x, _x_i1))))
      | HasType ((_x, _x_i1)) ->
          let (o, _x) = o#pattern _x in
          let (o, _x_i1) = o#datatype' _x_i1 in (o, (HasType ((_x, _x_i1))))

    method pattern : Pattern.with_pos -> ('self_type * Pattern.with_pos) =
      WithPos.traverse_map
        ~o
        ~f_pos:(fun o v -> o#position v)
        ~f_node:(fun o v -> o#patternnode v)

    method name : name -> ('self_type * name) = o#string

    method location : Location.t -> ('self_type * Location.t) = o#unknown

    method iterpatt : iterpatt -> ('self_type * iterpatt) =
      function
      | List ((_x, _x_i1)) ->
          let (o, _x) = o#pattern _x in
          let (o, _x_i1) = o#phrase _x_i1 in (o, (List ((_x, _x_i1))))
      | Table ((_x, _x_i1)) ->
          let (o, _x) = o#pattern _x in
          let (o, _x_i1) = o#phrase _x_i1 in (o, (Table ((_x, _x_i1))))

    method funlit : funlit -> ('self_type * funlit) =
      fun (_x, _x_i1) ->
        let (o, _x) = o#list (fun o -> o#list (fun o -> o#pattern)) _x in
        let (o, _x_i1) = o#phrase _x_i1 in (o, (_x, _x_i1))

    method handle_params : handler_parameterisation -> ('self_type * handler_parameterisation) =
      fun params ->
        let (o, bindings) =
          o#list
            (fun o (pat, expr) ->
              let (o, expr) = o#phrase expr in
              let (o, pat) = o#pattern pat in
              (o, (pat, expr)))
            params.shp_bindings
        in
        (o, { params with shp_bindings = bindings })

    method fieldspec : Datatype.fieldspec -> ('self_type * Datatype.fieldspec) =
      let open Datatype in function
      | Present _x -> let (o, _x) = o#datatype _x in (o, Present _x)
      | Absent -> (o, Absent)
      | Var _x -> let (o, _x) = o#known_type_variable _x in (o, Var _x)

    method fieldconstraint : fieldconstraint -> ('self_type * fieldconstraint) =
      fun fc -> (o, fc)

    method directive : directive -> ('self_type * directive) =
      fun (_x, _x_i1) ->
        let (o, _x) = o#string _x in
        let (o, _x_i1) = o#list (fun o -> o#string) _x_i1 in (o, (_x, _x_i1))

    method datatype' : datatype' -> ('self_type * datatype') =
      fun (_x, _x_i1) ->
        let (o, _x) = o#datatype _x in
        let (o, _x_i1) = o#option (fun o -> o#unknown) _x_i1
        in (o, (_x, _x_i1))

    method datatypenode : Datatype.t -> ('self_type * Datatype.t) =
      let open Datatype in
      function
      | TypeVar _x ->
          let (o, _x) = o#known_type_variable _x in (o, (TypeVar _x))
      | QualifiedTypeApplication (ns, args) ->
          let (o, ns) = o#list (fun o -> o#name) ns in
          let (o, args) = o#list (fun o -> o#type_arg) args in
          (o, QualifiedTypeApplication (ns, args))
      | Function (_x, _x_i1, _x_i2) ->
          let (o, _x) = o#list (fun o -> o#datatype) _x in
          let (o, _x_i1) = o#row _x_i1 in
          let (o, _x_i2) = o#datatype _x_i2
          in (o, (Function (_x, _x_i1, _x_i2)))
      | Lolli (_x, _x_i1, _x_i2) ->
          let (o, _x) = o#list (fun o -> o#datatype) _x in
          let (o, _x_i1) = o#row _x_i1 in
          let (o, _x_i2) = o#datatype _x_i2
          in (o, (Lolli (_x, _x_i1, _x_i2)))
      | Mu (_x, _x_i1) ->
          let (o, _x) = o#name _x in
          let (o, _x_i1) = o#datatype _x_i1 in (o, (Mu (_x, _x_i1)))
      | Forall (_x, _x_i1) ->
          (*let (o, _x) = o#list (fun o -> o#quantifier) _x in*)
          let (o, _x_i1) = o#datatype _x_i1 in (o, (Forall (_x, _x_i1)))
      | Unit -> (o, Unit)
      | Tuple _x ->
          let (o, _x) = o#list (fun o -> o#datatype) _x
          in (o, (Tuple _x))
      | Record _x -> let (o, _x) = o#row _x in (o, (Record _x))
      | Variant _x -> let (o, _x) = o#row _x in (o, (Variant _x))
      | Effect r -> let (o, r) = o#row r in (o, Effect r)
      | Table (_x, _x_i1, _x_i2) ->
          let (o, _x) = o#datatype _x in
          let (o, _x_i1) = o#datatype _x_i1 in
          let (o, _x_i2) = o#datatype _x_i2 in (o, (Table (_x, _x_i1, _x_i2)))
      | List _x -> let (o, _x) = o#datatype _x in (o, (List _x))
      | TypeApplication (_x, _x_i1) ->
          let (o, _x) = o#string _x in
          let (o, _x_i1) = o#list (fun o -> o#type_arg) _x_i1
          in (o, TypeApplication (_x, _x_i1))
      | Primitive _x ->
          let (o, _x) = o#unknown _x in (o, (Primitive _x))
      | DB -> (o, DB)
      | Input (_x, _x_i1) ->
        let (o, _x) = o#datatype _x in
        let (o, _x_i1) = o#datatype _x_i1 in (o, Input (_x, _x_i1))
      | Output (_x, _x_i1) ->
        let (o, _x) = o#datatype _x in
        let (o, _x_i1) = o#datatype _x_i1 in (o, Output (_x, _x_i1))
      | Select _x ->
        let (o, _x) = o#row _x in (o, Select _x)
      | Choice _x ->
        let (o, _x) = o#row _x in (o, Choice _x)
      | Dual _x ->
        let (o, _x) = o#datatype _x in (o, Dual _x)
      | End -> (o, End)

    method datatype : Datatype.with_pos -> ('self_type * Datatype.with_pos) =
      WithPos.traverse_map
        ~o
        ~f_pos:(fun o v -> o#position v)
        ~f_node:(fun o v -> o#datatypenode v)

    method type_arg : Datatype.type_arg -> ('self_type * Datatype.type_arg) =
      let open Datatype in function
      | Type _x -> let (o, _x) = o#datatype _x in (o, Type _x)
      | Row _x -> let (o, _x) = o#row _x in (o, Row _x)
      | Presence _x -> let (o, _x) = o#fieldspec _x in (o, Presence _x)

    method constant : Constant.t -> ('self_type * Constant.t) =
      function
      | Constant.Float _x ->
         let (o, _x) = o#float _x in (o, (Constant.Float _x))
      | Constant.Int _x ->
         let (o, _x) = o#int _x in (o, (Constant.Int _x))
      | Constant.String _x ->
         let (o, _x) = o#string _x in (o, (Constant.String _x))
      | Constant.Bool _x ->
         let (o, _x) = o#bool _x in (o, (Constant.Bool _x))
      | Constant.Char _x ->
         let (o, _x) = o#char _x in (o, (Constant.Char _x))

    method binop : BinaryOp.t -> ('self_type * BinaryOp.t) =
      let open BinaryOp in function
      | Minus -> (o, Minus)
      | FloatMinus -> (o, FloatMinus)
      | RegexMatch _x ->
          let (o, _x) = o#list (fun o -> o#regexflag) _x
          in (o, (RegexMatch _x))
      | And -> (o, And)
      | Or -> (o, Or)
      | Cons -> (o, Cons)
      | Name _x -> let (o, _x) = o#name _x in (o, (Name _x))

    method tybinop : tyarg list * BinaryOp.t -> 'self_type * (tyarg list * BinaryOp.t) =
      fun (_x, _x_i1) ->
        let (o, _x_i1) = o#binop _x_i1 in (o, (_x, _x_i1))

    method bindingnode : bindingnode -> ('self_type * bindingnode) =
      function
      | Val ((_x, (_x_i1, _x_i2), _x_i3, _x_i4)) ->
          let (o, _x   ) = o#pattern _x in
          let (o, _x_i2) = o#phrase _x_i2 in
          let (o, _x_i3) = o#location _x_i3 in
          let (o, _x_i4) = o#option (fun o -> o#datatype') _x_i4
          in (o, (Val ((_x, (_x_i1, _x_i2), _x_i3, _x_i4))))
      | Fun f -> let o, f = o#function_definition f in o, Fun f
      | Funs _x ->
          let (o, _x) = o#list (fun o -> o#recursive_function) _x in
          (o, (Funs _x))
      | Foreign ((_x, _x_i1, _x_i2, _x_i3, _x_i4)) ->
          let (o, _x) = o#binder _x in
          let (o, _x_i1) = o#name _x_i1 in
          let (o, _x_i2) = o#name _x_i2 in
          let (o, _x_i3) = o#name _x_i3 in
          let (o, _x_i4) = o#datatype' _x_i4
          in (o, (Foreign ((_x, _x_i1, _x_i2, _x_i3, _x_i4))))
      | Import { pollute; path } ->
          let (o, path') = o#list (fun o n -> o#name n) path in
          (o, Import { pollute; path = path' })
      | Open _xs ->
          let (o, _xs) = o#list (fun o n -> o#name n) _xs in
          (o, Open _xs)
      | Typenames (ts) ->
          let (o, ts) = o#list (fun o (_x, _x_i1, _x_i2, _x_i3) ->
            let (o, _x) = o#name _x in
            let (o, _x_i1) =
              o#list
                (fun o (_x, _x_i1) ->
                   let (o, _x_i1) = o#option (fun o -> o#unknown) _x_i1
                   in (o, (_x, _x_i1)))
                _x_i1 in
            let (o, _x_i2) = o#datatype' _x_i2
            in (o, (_x, _x_i1, _x_i2, _x_i3))) ts
          in (o, Typenames ts)
      | Infix -> (o, Infix)
      | Exp _x -> let (o, _x) = o#phrase _x in (o, (Exp _x))
      | Module { binder; members } ->
          let (o, binder) = o#binder binder in
          let (o, members) = o#list (fun o -> o#binding) members in
          (o, (Module { binder; members }))
      | AlienBlock (lang, lib, dts) ->
          let (o, lang) = o#name lang in
          let (o, lib) = o#name lib in
          let (o, dts) = o#list (fun o (b, dt) ->
            let (o, b) = o#binder b in
            let (o, dt) = o#datatype' dt in
            (o, (b, dt))
          ) dts in
          (o, (AlienBlock (lang, lib, dts)))

    method binding : binding -> ('self_type * binding) =
      WithPos.traverse_map
        ~o
        ~f_pos:(fun o v -> o#position v)
        ~f_node:(fun o v -> o#bindingnode v)

    method function_definition : function_definition -> 'self * function_definition
      = fun { fun_binder = _x;
              fun_linearity = _x1;
              fun_definition = (_x_i1, _x_i2);
              fun_location = _x_i3;
              fun_signature = _x_i4;
              fun_unsafe_signature = _x_i5; }->
      let (o, _x) = o#binder _x in
      let (o, _x_i2) = o#funlit _x_i2 in
      let (o, _x_i3) = o#location _x_i3 in
      let (o, _x_i4) = o#option (fun o -> o#datatype') _x_i4 in
      (o, { fun_binder = _x;
            fun_linearity = _x1;
            fun_definition = (_x_i1, _x_i2);
            fun_location = _x_i3;
            fun_signature = _x_i4;
            fun_unsafe_signature = _x_i5; })

    method recursive_function  : recursive_function -> 'self * recursive_function
      = fun { rec_binder = _x;
              rec_linearity = _x1;
              rec_definition = (_x_i1, _x_i2);
              rec_location = _x_i3;
              rec_signature = _x_i4;
              rec_unsafe_signature = _x_i5;
              rec_pos = _x_i6 } ->
      let (o, _x) = o#binder _x in
      let (o, _x_i2) = o#funlit _x_i2 in
      let (o, _x_i3) = o#location _x_i3 in
      let (o, _x_i4) = o#option (fun o -> o#datatype') _x_i4 in
      let (o, _x_i6) = o#position _x_i6 in
      (o, { rec_binder = _x;
            rec_linearity = _x1;
            rec_definition = (_x_i1, _x_i2);
            rec_location = _x_i3;
            rec_signature = _x_i4;
            rec_unsafe_signature = _x_i5;
            rec_pos = _x_i6 })

    method binder : Binder.with_pos -> ('self_type * Binder.with_pos) =
      Binder.traverse_map
        ~o
        ~f_pos:(fun o v -> o#position v)
        ~f_name:(fun o v -> o#name v)
        ~f_ty:(fun o v -> o, v)

    method unknown : 'a. 'a -> ('self_type * 'a) = fun x -> (o, x)
  end
