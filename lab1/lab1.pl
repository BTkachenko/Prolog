/*Zadanie 1*/

rodzic(X,Y):- ojciec(X,Y);matka(X,Y).
jest_matka(X) :- matka(X,Y).     /* X jest matk� */
jest_ojcem(X):- ojciec(X,Y). /* X jest ojcem */
jest_synem(X):- mezczyzna(X),rodzic(Y,X). /* X jest synem */
siostra(X,Y):- kobieta(X),rodzenstwo(X,Y). /* X jest siostr� Y */
dziadek(X,Y):-ojciec(X,Z),ojciec(Z,Y).   /* X jest dziadkiem Y */
rodzenstwo(X,Y):- rodzic(Z,X),!,rodzic(Z,Y),X\=Y. /* X i Y s� rodze�stwem */


mezczyzna(syn1).
mezczyzna(ojciec1).
mezczyzna(dziadek1).
mezczyzna(brat1).
kobieta(siostra1).
kobieta(matka1).

ojciec(ojciec1,syn1).
ojciec(dziadek1,ojciec1).
ojciec(ojciec1,siostra1).
ojciec(ojciec1,brat1).
matka(matka1,syn1).
matka(matka1,siostra1).


/*Zadanie 2*/

above(Block1,Block2) :-
    (on(Block1,Block2)
    ;
    on(Block1,Block3),
    above(Block3,Block2)).


on(f,e).
on(e,d).
on(d,c).
on(c,b).
on(b,a).


/*Zadanie 3*/

prime_number(2).
prime_number(3).
prime_number(X) :- X>3,X mod 2 =\=0, \+ has_factor(3,X).
has_factor(X,N):- N mod X =:= 0.
has_factor(X,N):- X*X<N,X2 is X + 2, has_factor(X2,N).

prime(LO,HI,N):- between(LO,HI,N),prime_number(N).
