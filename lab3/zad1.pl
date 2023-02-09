
suma([],0,0).
suma([H|T],C,S) :-
    suma(T,X,Y),
    C is X + 1,
    S is Y + H.

wariancja(L,X) :-
    suma(L,C,S),
    Avg is S / C,
    dev_sum(L,Avg,W),
    X is W / C.

dev_sum([],_,0).
dev_sum([H|T],Avg,W) :-
    dev_sum(T,Avg,X),
    W is X + (H - Avg)^2 .
