%easy
fac(0, 1).
fac(N, What) :- N1 is N - 1, fac(N1, P), What is P * N.

%count up tail recursive
fac_tro(N, What) :- fac_tro(N, 0, 1, What).
fac_tro(N, N, What, What).
fac_tro(N, C, A, What) :- C < N, C1 is C + 1, A1 is A * C1, fac_tro(N, C1, A1, What).

%count down tail recursive
fac_tro2(N, What) :- fac_tro2(N, 1, What).
fac_tro2(0, What, What).
fac_tro2(N, A, What) :- N > 0, A1 is N*A, N1 is N - 1, fac_tro2(N1, A1, What).