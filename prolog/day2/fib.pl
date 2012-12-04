%----------------------------%
%easy straightforward recursion.
fib(0, 1).
fib(1, 1).
fib(N, What) :- N1 is N - 1, N2 is N - 2, fib(N1, A), fib(N2, B), What is A + B.

%-----------------------------%
%don't calculate them more than worse, work up from the bottom to the N
%also, it's tail recursive, so it can be optimized to be iterative.
fib_tro(0, 1).
fib_tro(1, 1).
fib_tro(N, What) :- fib_tro(1, 1, 2, N, What).
%fib_tro(fib(N-2), fib(N-1), current N we've iterated up to , target N, return value)
fib_tro(X1, X2, N, N, What) :- What is X1 + X2.
fib_tro(X1, X2, M, N, What) :- M < N, M1 is M + 1, X3 is X1 + X2, fib_tro(X2, X3, M1, N, What).