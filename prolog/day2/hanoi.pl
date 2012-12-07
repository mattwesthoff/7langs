%simple solve and print the moves:
solve(1, From, _, To) :- write(From), write(' -> '), write(To), nl.

solve(Discs, From, Other, To) :- 
	Discs1 is Discs - 1,
	solve(Discs1, From, To, Other),
	solve(1, From, _, To),
	solve(Discs1, Other, From, To).


%visualized solving:
spacer(0, _, Output, Output).
spacer(N, Delim, Spacer, Output) :-
	N1 is N - 1,
	string_concat(Delim, Spacer, S1),
	spacer(N1, Delim, S1, Output).

padCol(Output, N, N, Output).
padCol(Col, N, Length, Output) :-
	spacer(N, ' ', '', Padding),
	append([Padding], Col, Out1),
	length(Out1, L1),
	padCol(Out1, N, L1, Output).
padCol(Col, N, Output) :-
	length(Col, Length),
	padCol(Col, N, Length, Output).

printCols([],[],[]).
printCols([R1|C1], [R2|C2], [R3|C3]) :-
	write(R1), write('|'), write(R2), write('|'), write(R3), nl,
	printCols(C1, C2, C3).

printCols(Count, A, B, C) :-
	nb_getval(A, Col1),
	nb_getval(B, Col2),
	nb_getval(C, Col3),
	padCol(Col1, Count, PCol1),
	padCol(Col2, Count, PCol2),
	padCol(Col3, Count, PCol3),
	printCols(PCol1, PCol2, PCol3).

createStartCol(N, N, Output, Output).
createStartCol(N, C, Col, Output) :-
	Diff is N - C,
	spacer(Diff, '-', '', Dashes),
	spacer(C, ' ', '', Spaces),
	string_concat(Dashes, Spaces, Padding),
	append([Padding], Col, Out1),
	C1 is C + 1,
	createStartCol(N, C1, Out1, Output).

hanoi(N) :-
	createStartCol(N, 0, [], Col1),
	nb_setval(a, Col1),
	nb_setval(b, []),
	nb_setval(c, []),
	printCols(N, a, b, c).
