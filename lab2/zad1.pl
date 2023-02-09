tab_size([_|L],X):-
    tab_size(L,I),
    X is I+1,
    !.
tab_size([_|_],X):-
    X is 1.

srodkowy(L,X):-
    tab_size(L,I),
    I mod 2 =:= 1,
    K is round(I/2),
    nth1(K,L,X).
