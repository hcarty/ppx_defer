(lang dune 2.0)
(name ppx_defer)
(allow_approximate_merlin)

(license MIT)
(maintainers "Hezekiah M. Carty <hez@0ok.org>")
(authors "Hezekiah M. Carty <hez@0ok.org>")

(source (github hcarty/ppx_defer))

(generate_opam_files true)

(package
 (name ppx_defer)
 (synopsis "Go-like [%defer later]; now syntax")
 (depends
  (ocaml (>= 4.02.3))
  (dune (>= 2.0))
  (lwt :with-test)
  (lwt_ppx :with-test)
  (ocaml-migrate-parsetree (>= 1.5.0))
  ppx_tools_versioned))
