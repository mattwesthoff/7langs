fibl := method(n, a := 0; b := 0; c := 1; n repeat(x := c + b; b = c; a = b; c = x); c)
fibr := method(n, if(n <= 1, 1, fibr(n-2) + fibr(n-1)))

fibl_answers := list()
fibr_answers := list()

for(n, 0, 16, fibl_answers append(fibl(n)); fibr_answers append(fibr(n)))
fibl_answers println
fibr_answers println
