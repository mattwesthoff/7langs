reverse([], Output, Output).
reverse(Input, Output) :- reverse(Input, [], Output).
reverse([X|Rest], Result, Output) :-
	append([X], Result, NewOut),
	reverse(Rest, NewOut, Output).

smallest([X], X). %last item in a list is the smallest
smallest([Head|Rest], Output) :- smallest(Rest, Val), Val =< Head, Output is Val.
smallest([Head|Rest], Output) :- smallest(Rest, Val), Head < Val, Output is Head.