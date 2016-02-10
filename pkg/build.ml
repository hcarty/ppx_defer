#!/usr/bin/env ocaml
#directory "pkg"
#use "topkg.ml"

let () =
  Pkg.describe "ppx_defer" ~builder:(`OCamlbuild []) [
    Pkg.lib "pkg/META";
    Pkg.bin ~auto:true "src/ppx_defer" ~dst:"../lib/ppx_defer/ppx_defer";
    Pkg.doc "README.md";
    Pkg.doc "LICENSE";
  ]
