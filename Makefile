all:
	ocaml pkg/build.ml native=true native-dynlink=true

clean:
	ocamlbuild -clean
