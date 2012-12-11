reverse([], Output, Output).
reverse([X|Rest], Result, Output) :-
	append([X], Result, NewOut),
	reverse(Rest, NewOut, Output).
reverse(Input, Output) :- reverse(Input, [], Output).

smallest([X], X). %last item in a list is the smallest
smallest([Head|Rest], Output) :- smallest(Rest, Val), Val =< Head, Output is Val.
smallest([Head|Rest], Output) :- smallest(Rest, Val), Head < Val, Output is Head.

mysort([X], [X]).
mysort([Head|Rest], Output) :- mysort(Rest, [Next|NextRest]), Next > Head, append([Head], [Next|NextRest], Output).
mysort([Head|Rest], Output) :- mysort(Rest, [Next|NextRest]), Next =< Head, append([Next], [Head|NextRest], Output).