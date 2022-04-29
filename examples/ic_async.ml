open Core
open Async

let write line =
  let stdout = Lazy.force Writer.stdout in
  Writer.write stdout line;
  Writer.flushed stdout

let promise =
  [%defer.async write " world"];
  write "Hello"

let command =
  Command.async
  ~summary:"test ppx_defer for async"
  (Command.Param.return (fun () -> promise))

let () =
  Command_unix.run command
