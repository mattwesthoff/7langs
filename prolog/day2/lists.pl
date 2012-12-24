reverse([], Output, Output).
reverse([X|Rest], Result, Output) :-
	append([X], Result, NewOut),
	reverse(Rest, NewOut, Output).
reverse(Input, Output) :- reverse(Input, [], Output).

smallest([X], X). %last item in a list is the smallest
smallest([Head|Rest], Output) :- smallest(Rest, Val), Val =< Head, Output is Val.
smallest([Head|Rest], Output) :- smallest(Rest, Val), Head < Val, Output is Head.

remove(_, [], Result, Result).
remove(Elem, [H|Arr], Result, Output) :- 
	H = Elem, 
	remove(Elem, Arr, Result, Output).
remove(Elem, [H|Arr], Result, Output) :- 
	H \= Elem, 
	append(Result, [H], NResult),
	remove(Elem, Arr, NResult, Output).
remove(Elem, Arr, Output) :- remove(Elem, Arr, [], Output).

mysort([X|[]], Curr, Output) :- append(Curr, [X], Output).
mysort(Arr, Curr, Output) :- 
	smallest(Arr, Smallest), 
	append(Curr, [Smallest], NewCurr),
	remove(Smallest, Arr, Rest),
	mysort(Rest, NewCurr, Output).
mysort(Arr, Output) :- mysort2(Arr, [], Output).

pivot(Pivot, [], [], []).
pivot(Pivot, [H|Arr], [H|Less], Greater) :-
	H =< Pivot, pivot(Pivot, Arr, [H|Less], Greater).
pivot(Pivot, [H|Arr], Less, Greater) :-
	H > Pivot, pivot(Pivot, Arr, Less, [H|Greater]).

quicksort([],[]).
quicksort([H|List], Output) :-
	pivot(H, List, Less, Greater),
	quicksort(Less, Out1),
	quicksort(Greater, Out2),
	append(Out1, [H|Out2], Output).