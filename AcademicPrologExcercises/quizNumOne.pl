likes(mary,food).

likes(mary,wine).

likes(john,wine).

likes(john,mary).

likes(john,X):-likes(mary,X).
likes(john,Y):-likes(Y,wine).
likes(john,Z):-likes(Z,Z).
