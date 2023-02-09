max_sum([],0).
max_sum(L,S) :-
    max_s(L,0,0,S).

max_s([H|T],Cur,Max,Sum):-
    C1 is max(Cur+H,0),
    M1 is max(C1,Max),
    max_s(T,C1,M1,Sum).
max_s([],_,Max,Max).
