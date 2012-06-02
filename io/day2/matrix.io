//this doesn't crash on non-"matrix" lists, but it does do weird things, not
// sure it belongs on List, but oh well
List transpose := method(self map(i,r, self map(c, c at (i))))

Matrix := Object clone do(
       rows ::= nil
       init := method(setRows(list()))

       //make dim return self and not the rows, that way you can do x := Matrix clone dim(3,4), 
       // instead of Matrix clone do(dim(3,4)).  Not sure how idiomatic that is?
       // Maybe dim should clone and return on it's own?  No I'd like to be able to reset a matrix
       dim := method(x,y, y repeat(rows append(list() setSize(x))); self)

       set := method(x,y,value, rows at(y) atPut(x, value))
       get := method(x,y, rows at(y) at(x))

       //not sure which of these I'd like, maybe modified by asMutable?
       transpose := method(Matrix clone setRows(rows transpose))
       transpose_me := method(rows = rows transpose; self)

       println := method(i := self rows map(y, y join(",")) join("],["); "[[#{i}]]" interpolate println)
)

//I guess we could do more checking here, but eh
Object squareBrackets := method(Matrix clone setRows(call message arguments map(x, if(x type == "Message", x arguments, x))))

#the following is so much prettier, but it only ends up with a list, and if you put the matrix clone in front,
# you end up with a matrix with rows containing matrices
#Object squareBrackets := method(call evalArgs)

m := Matrix clone dim(3,4)
m set(1,2,"THING PLACE MESSAGE")
m get(1,2) println
m println

b := [[3,5,6],[7,5,5],[3,2,3]]
b println
b get(1,2) println
b transpose_me println
b get(2,1) println
b transpose println