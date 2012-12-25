alldiff(N1, N2, N3, N4) :-
	N1 \= N2, N1 \= N3, N1 \= N4,
	N2 \= N3, N2 \= N4,
	N3 \= N4.

inrange(H) :- What = H, 0 < What, What < 5.
allinrange([]).
allinrange([H|Rest]) :- inrange(H), allinrange(Rest).

correct(N1, N2, N3, N4) :-
	allinrange([N1, N2, N3, N4]),
	alldiff(N1, N2, N3, N4).

sudoku(N11,N12,N13,N14,N21,N22,N23,N24,N31,N32,N33,N34,N41,N42,N43,N44, Solution) :-
	Solution = [N11,N12,N13,N14,N21,N22,N23,N24,N31,N32,N33,N34,N41,N42,N43,N44],
	%rows
	correct(N11, N12, N13, N14),	
	correct(N21, N22, N23, N24),
	correct(N31, N32, N33, N34),
	correct(N41, N42, N43, N44),

	%boxes
	correct(N11, N12, N21, N22),
	correct(N31, N32, N41, N42),
	correct(N13, N14, N23, N24),
	correct(N33, N34, N43, N44),

	%cols
	correct(N11, N21, N31, N41),
	correct(N12, N22, N32, N42),
	correct(N13, N23, N33, N43),
	correct(N14, N24, N34, N44).