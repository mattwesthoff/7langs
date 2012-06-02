Matrix := Object clone do(
       rows ::= nil
       init := method(setRows(list()))

       //make dim return self and not the rows, that way you can do x := Matrix clone dim(3,4), 
       // instead of Matrix clone do(dim(3,4)).  Not sure how idiomatic that is?
       // Maybe dim should clone and return on it's own?  No I'd like to be able to reset a matrix
       dim := method(x,y, y repeat(rows append(list() setSize(x))); self)

       set := method(x,y,value, rows at(y) atPut(x, value))
       get := method(x,y, rows at(y) at(x))
       println := method(self rows println)
)

Object squareBrackets := method(Matrix clone setRows(call message arguments map(x, if(x type == "Message", x arguments, x))))

m := Matrix clone dim(3,4)
m set(1,2,"hi")
m get(1,2) println
m println

b := [[3,5,6],[7,5,5],[3,2,3]]
b println