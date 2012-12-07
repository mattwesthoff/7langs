outputCol(0, 0, _).

outputCol(N, N, A1) :- 
	write('-'),
	A1 is N - 1.

outputCol(N, A, A1) :-
	N > A,
	write(' '),
	A1 is A.

output(0,0,0,0).

output(N, A, B, C) :-
	outputCol(N, A, A1),
	write('|'),
	outputCol(N, B, B1),
	write('|'),
	outputCol(N, C, C1),
	nl,
	N1 is N - 1,
	output(N1, A1, B1, C1).

solve(1, From, _, To) :- write(From), write(' -> '), write(To), nl.

solve(Discs, From, Other, To) :- 
	Discs1 is Discs - 1,
	solve(Discs1, From, To, Other),
	solve(1, From, _, To),
	solve(Discs1, Other, From, To).