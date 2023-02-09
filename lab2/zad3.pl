osiagalny(X,Y) :- sciezka(X,Y,[]).
sciezka(X,Y,PASSED):-
    arc(X,Z),
        \+ member(X,PASSED),

        sciezka(Z,Y,[X|PASSED]).

sciezka(X,X,_).

arc(a,b).
arc(b,a).
arc(b,c).
arc(c,d).
