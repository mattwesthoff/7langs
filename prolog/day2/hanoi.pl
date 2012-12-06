hanoi(1, FromPeg, ToPeg, _) :- write(FromPeg), write(' -> '), write(ToPeg), nl.

hanoi(Discs, FromPeg, ToPeg, OtherPeg) :- 
	Discs1 is Discs - 1,
	hanoi(Discs1, FromPeg, OtherPeg, ToPeg),
	hanoi(1, FromPeg, ToPeg, _),
	hanoi(Discs1, OtherPeg, ToPeg, FromPeg).