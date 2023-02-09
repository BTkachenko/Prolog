permute([],[]).
permute([X|R],L):-
    permute(R,L1),
    select(X,L,L1).

merge_list([H|T],[H1|T1],[H,H1|TAIL])
:-merge_list(T,T1,TAIL).



merge_list([],L,L).

list(N,X):-
    findall(N1,between(1,N,N1),L),
    permute(L,L1),
    merge_list(L,L1,X).
