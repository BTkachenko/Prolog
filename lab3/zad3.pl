odd_insert(X,L,[X|L]).
odd_insert(X,[H1,H2|T1],[H1,H2|T2]) :-
    odd_insert(X,T1,T2).

even_insert(X,[H|T],[H,X|T]).
even_insert(X,[H1,H2|T1],[H1,H2|T2])
     :- even_insert(X,T1,T2).


odd_permutation([X|Xs],Ys) :-
    odd_permutation(Xs,Z),
    odd_insert(X,Z,Ys).
odd_permutation([X|Xs],Ys) :-
    even_permutation(Xs,Z),
    even_insert(X,Z,Ys).

even_permutation([],[]).
even_permutation([X|Xs], Ys) :-
    even_permutation(Xs, Z),
    odd_insert(X, Z, Ys).
even_permutation([X|Xs], Ys) :-
    odd_permutation(Xs, Z),
    even_insert(X, Z, Ys).
