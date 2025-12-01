open Base

(executable
 (name main)
 (libraries base fqueue_extended))

(library
 (name fqueue)
 (modules fqueue)
 (libraries base))

(library
 (name foldable)
 (modules foldable)
 (libraries base))

(library
 (name fqueue_extended)
 (modules fqueue_extended)
 (libraries fqueue foldable))