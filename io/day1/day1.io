testTrue := method(t, n, t and true ifTrue("#{n} is true!" interpolate println) ifFalse("#{n} is false!" interpolate println))
testTrue(0, "zero")
testTrue("", "empty string")
testTrue(nil, "nil")

testBag := Object clone
testBag slotSummary println

testBag mySlot := "this like calling addSlot"
testBag slotSummary println

testBag mySlot = "This is like calling updateSlot"
testBag slotSummary println

testBag myOtherSlot ::= "this is like calling newSlot"
testBag slotSummary println
"notice the setter method newSlot created" println

"also, slotNames:" println
testBag slotNames println

#say hi four times
//so many comment options
/* all the options */
4 repeat("hi" println)


"" println
"time to mess with Number!"
1 + 1 println
try ((1 + "5") println) catch(Exception, "can't add numbers and sequences" println)
Number setSlot("addition", Number getSlot("+"))
Number setSlot("+", method(right, self addition(right ?asNumber)))
1 + "5" println
"now you can, mostly!" println
(1 + "one") println
"whoops, don't really change Number haha" println

Sequence + := method(right, self .. right)
("15" + "07") println

"I guess I'd call Io a strongly and dynamically typed language?" println
"semantics" println

//From StackOverflow:

Animal := Object clone do (
    legs ::= nil    // creates leg slot  & setLegs() setter
    tail ::= nil    // creates tail slot & setTail() setter
)

// I think below is more aesthetic 
Cat := Animal clone setLegs(4) setTail(1)

// compared to this
Dog := Animal clone do (legs = 4; tail = 1)

//good point