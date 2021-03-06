/*
 * X is 5+4.
 * 12 is 7+3.
 * X is 3/2,Y is 3 div 2.
 * 7-2<5+2.
 * 2<1.
*/


gcd(X,X,X).
gcd(X,Y,D):-X<Y, Y1 is Y-X, gcd(X,Y1,D).
gcd(X,Y,D):-Y<X, gcd(Y,X,D).

length1([ ],0).
length1([_|Tail],N):-length1(Tail,N1),N is N1+1.

length2([ ],0).
length2([_|Tail ],N):- length2(Tail,N1), N = 1+N1.
