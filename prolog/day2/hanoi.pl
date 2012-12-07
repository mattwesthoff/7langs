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
	padCol(A, Count, PCol1),
	padCol(B, Count, PCol2),
	padCol(C, Count, PCol3),
	printCols(PCol1, PCol2, PCol3).
printCols(N) :-
	nb_getval(a, A), nb_getval(b, B), nb_getval(c, C),
	printCols(N, A, B, C).

createStartCol(N, N, Output, Output).
createStartCol(N, C, Col, Output) :-
	Diff is N - C,
	spacer(Diff, '-', '', Dashes),
	spacer(C, ' ', '', Spaces),
	string_concat(Dashes, Spaces, Padding),
	append([Padding], Col, Out1),
	C1 is C + 1,
	createStartCol(N, C1, Out1, Output).

writeMove(_, []).
writeMove(N, [[From|[To|_]]|Rest]) :-
	write(From), write(' -> '), write(To), nl,
	nb_getval(From, FromCol), nb_getval(To, ToCol),
	append([Top], NewFrom, FromCol),
	append([Top], ToCol, NewTo),
	nb_setval(From, NewFrom), nb_setval(To, NewTo),
	printCols(N), nl,
	writeMove(N, Rest).

addMove(From, To) :-
	nb_getval(moves, Moves),
	append(Moves, [[From, To]], NewMoves),
	nb_setval(moves, NewMoves).

vsolve(1, From, _, To) :-
	addMove(From, To).

vsolve(N, From, Other, To) :- 
	N1 is N - 1,
	vsolve(N1, From, To, Other),
	vsolve(1, From, _, To),
	vsolve(N1, Other, From, To).

hanoi(N) :-
	nb_setval(moves, []),
	createStartCol(N, 0, [], A),
	write('start:'), nl,
	printCols(N, A, [], []),
	vsolve(N, a, b, c),
	nb_getval(moves, Moves),
	nb_setval(a, A), nb_setval(b, []), nb_setval(c, []),
	writeMove(N, Moves).