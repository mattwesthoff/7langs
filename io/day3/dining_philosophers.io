Fork := Object clone

Philosopher := Object clone do (
    state ::= nil
    leftFork ::= nil
    rightFork ::= nil
    myForks ::= nil
    
    init := method(myForks = list())
    
    eat := method(
        say("eating!")
        wait(Random value(0,2))
        say("done eating!")
    )
    
    think := method(
        say("thinking!")
        wait(Random value(0,2))
        say("done thinking!")
    )
    
    sit_down := method(
        if(table contains(leftFork),
            table remove(leftFork)
            myForks append(leftFork))
            
        if (table contains(rightFork),
            table remove(rightFork)
            myForks append(rightFork))
            
        if(myForks size == 2, eat, think)
        
        myForks foreach(fork, table append(fork))
        myForks = list()
        
        wait(Random value(0,1))
    )
    
    say := method(s, writeln(self type, " ", s))
)

Fork1 := Fork clone
Fork2 := Fork clone
Fork3 := Fork clone
Fork4 := Fork clone
Fork5 := Fork clone

table := list(Fork1, Fork2, Fork3, Fork4, Fork5)

Aristotle := Philosopher clone setLeftFork(Fork1) setRightFork(Fork2)
Avicenna := Philosopher clone setLeftFork(Fork2) setRightFork(Fork3)
Kant := Philosopher clone setLeftFork(Fork3) setRightFork(Fork4)
Nietzsche := Philosopher clone setLeftFork(Fork4) setRightFork(Fork5)
Quine := Philosopher clone setLeftFork(Fork5) setRightFork(Fork1)

loop(
    Aristotle @@sit_down
    Avicenna @@sit_down
    Kant @@sit_down
    Nietzsche @@sit_down
    Quine @@sit_down
    yield
)
