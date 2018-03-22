.PHONY: all clean examples repl test

all:
	jbuilder build --dev

clean:
	jbuilder clean

examples:
	jbuilder build @example --dev

repl:
	jbuilder utop src -- -require ppx_defer

test: examples
	jbuilder exec examples/ic.exe
