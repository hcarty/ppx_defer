let promise =
  let%lwt ic = Lwt_io.open_file ~mode:Lwt_io.input "ic_lwt.ml" in
  [%defer.lwt Lwt_io.close ic];
  let%lwt bytes = Lwt_io.read ic in
  Lwt_io.write Lwt_io.stdout bytes

let () = Lwt_main.run promise
