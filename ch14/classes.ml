(* 14.8 Binary Methods *)
class square w = object(self : 'self)
  method width = w
  method area = Float.of_int (self#width * self#width)
  method equals (other : 'self) = other#width = self#width
end

class circle r = object(self: 'self)
  method radius = r
  method area = 3.14 *. (Float.of_int self#radius) **. 2.0
  method equals (other : 'self) = other#radius = self#radius
end

let _ = (new square 5)#equals (new square 5)

let _ = (new circle 10)#equals (new circle 7)

type shape = < equals : shape -> bool; area : float >
(*let _ = (new square 5 :> shape)*)

let t = Poly.(=)
        (object method area = 5 end)
        (object method area = 5 end);

type shape_repr =
  | Square of int
  | Circle of int

type shape =
  < repr : shape_repr; equals : shape -> bool; area : float >

class square w = object(self)
  method width = w
  method area = Float.of_int (self#width * self#width)
  method repr = Square self#width
  method equals (other : shape) =
    match (self#repr, other#repr) with
    | Square x, Square x' -> Int.(=) x x'
    | _ -> false
end

(*module Shapes : sig
  type shape_repr
  type shape =
    < repr : shape_repr; equals : shape -> bool; area: float >
  class square : int ->
    object
      method width : int
      method area : float
      method repr : shape_repr
      method equals : shape -> bool
    end
  end = struct
    
  end*)

type shape_repr = ..

type shape =
  < repr : shape_repr; equals : shape -> bool; area : float >

type shape_repr += Square of int
class square w = object(self)
  method width = w
  method area = Float.of_int (self#width * self#width)
  method repr = Square self#width
  method equals (other : shape) =
    match (self#repr, other#repr) with
    | Square x, Square x' -> Int.(=) x x'
    | _ -> false
end

class square w = object(self)
  method width = w
  method area = Float.of_int (self#width * self#width)
  method larger (other : shape) = Float.(self#area > other#area)
end