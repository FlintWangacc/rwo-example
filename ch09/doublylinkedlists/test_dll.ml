(*open Base*)
open Stdio
open Doublylinkedlists

let () =
  let list = create () in
  printf "Is empty: %b\n" (is_empty list);
  
  let elt1 = insert_first list "first" in
  let elt2 = insert_after elt1 "second" in
  let _ = insert_after elt2 "third" in
  
  printf "Length should be 3\n";
  iter list ~f:(fun value -> printf "Value: %s\n" value);
  
  remove list elt2;
  printf "\nAfter removing second element:\n";
  iter list ~f:(fun value -> printf "Value: %s\n" value)