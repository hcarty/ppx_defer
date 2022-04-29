(lang dune 2.1)
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
  (ocaml (>= 4.11.0))
  (dune (>= 2.0))
  (lwt :with-test)
  (lwt_ppx :with-test)
  (core (and :with-test (<> os "win32")))
  (async (and :with-test (<> os "win32")))
  (core_unix (and :with-test (<> os "win32")))
  (ppxlib (>= 0.12.0))))
