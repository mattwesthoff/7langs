reverse([], Output, Output).
reverse(Input, Output) :- reverse(Input, [], Output).
reverse([X|Rest], Result, Output) :-
	append([X], Result, NewOut),
	reverse(Rest, NewOut, Output).

smallest([X], X). %last item in a list is the smallest
smallest([X|Rest], Output) :- X =< Output, NewOut is X, smallest(Rest, NewOut).
smallest([X|Rest], Output) :- X > Output, NewOut is Output, smallest(Rest, NewOut).
	