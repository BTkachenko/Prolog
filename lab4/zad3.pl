generuj(W, L, X) :-
    member(X, L) ->
    write(W), !;
    atom_length(W, N), tab(N).

poziome_kreski(L, N1, N2, N3) :-
    write(+), generuj(---, L, N1),
    write(+), generuj(---, L, N2),
    write(+), generuj(---, L, N3),
    write(+), nl.

pionowe_kreski(L, N1, N2, N3, N4) :-
    generuj("|", L, N1), tab(3),
    generuj("|", L, N2), tab(3),
    generuj("|", L, N3), tab(3),
    generuj("|", L, N4), nl.


rysowanie(X) :-
    poziome_kreski(X, 1, 2, 3),
    pionowe_kreski(X, 4, 5, 6, 7),
    poziome_kreski(X, 8, 9, 10),
    pionowe_kreski(X, 11, 12, 13, 14),
    poziome_kreski(X, 15, 16, 17),
    pionowe_kreski(X, 18, 19, 20, 21),
    poziome_kreski(X, 22, 23, 24).

kwadrat(_, 0, []).

% Reprezentacja jednego duzego kwadratu 3x3
kwadrat(duze, 1, [1, 2, 3,4, 7,11, 14,18,21,22,23,24]).

% Reprezentacja 4 srednich kwadratow 2x2 
kwadrat(srednie, 1, [ 1,2,4,6,11,13,15,16]).
kwadrat(srednie, 1, [ 2,3,5,7,12,14,16,17]). 
kwadrat(srednie, 1, [ 8,9,11,13,18,20,22,23]).
kwadrat(srednie, 1, [ 9,10,12,14,19,21,23,24]).

% Reprezentacja 9 malych kwadratow 1x1 
kwadrat(male, 1, [1,4,5,8]).
kwadrat(male, 1, [2,5,6,9]).
kwadrat(male, 1, [3,6,7,10]).
kwadrat(male, 1, [8,11,12,15]).
kwadrat(male, 1, [9,12,13,16]).
kwadrat(male, 1, [10,13,14,17]).
kwadrat(male, 1, [15,18,19,22]).
kwadrat(male, 1, [16,19,20,23]).
kwadrat(male, 1, [17,20,21,24]).

kwadrat(TYP, N, R) :-
    N1 is N - 1,
    N1 > 0,
    kwadrat(TYP, 1, X),
    kwadrat(TYP, N1, Y),
    min_list(X, SX),
    min_list(Y, SY),
    SX < SY,
    union(X, Y, R),
    R \= Y.


zapalki(C, L, M, S) :-
    kwadrat(duze, L, S3),
    kwadrat(srednie, M, S2),
    kwadrat(male, S, S1),
    union(S1, S2, U),
    union(U, S3, R),
    length(R, N),
    C is 24 - N,
    rysowanie(R).