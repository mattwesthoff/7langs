printstate([Col1|[Col2,Col3]]) :- printstate(Col1, Col2, Col3).

printstate([],[],[]) :- nl.

printstate([Row1|Tail1], [Row2|Tail2], [Row3|Tail3]) :- 
	write(Row1), write('|'), write(Row2), write('|'), write(Row3), nl,
	printstate(Tail1, Tail2, Tail3).

hanoi(N) :- printstate([['_    ', '__   ', '___  ', '____ '],['     ','     ','     ','     '],['     ','     ','     ','     ']]).

move([Col1|[Col2|Col3]], From, To) :-
	write('finish').

solve(1, FromPeg, ToPeg, _) :- write(FromPeg), write(' -> '), write(ToPeg), nl.

solve(Discs, FromPeg, ToPeg, OtherPeg) :- 
	Discs1 is Discs - 1,
	solve(Discs1, FromPeg, OtherPeg, ToPeg),
	solve(1, FromPeg, ToPeg, _),
	solve(Discs1, OtherPeg, ToPeg, FromPeg).