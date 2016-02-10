# ppx_defer

This is an OCaml language extension implementing a somewhat Go-like
`[%defer expr1]; expr2` which will defer the evaluation of `expr1` until after
`expr2`.

Thanks to Drup for guidance in figuring out ppx details!

## Using ppx_defer

```ocaml
let () =
  let ic = open_in_bin "some_file" in
  [%defer close_in ic];
  let length = in_channel_length ic in
  let bytes = really_input_string ic length in
  print_endline bytes
```
