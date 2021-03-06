/*taking 4th element in the list
 * [X1,X2,X3,X4|T]=[_,_,_,X4|_].
 *
 * Example:
 * [a,e|T] matches with T=[i,o,u]
 * [a,e|T]=[i,o,u].
 * --------false
 *
 * [a|[e|T]] matches L with T=[ i,o,u] as [e|T] has to match
[e,i,o,u].
 *  [e|T]=[e,i,o,u].
 *
 *
 *
*/


/*access members of list*/
member1(X,[X|_]).
member1(X,[_|T]):-member1(X,T).

/*concatenate lists*/
conc([ ],L,L).
conc([X|T],L,[X|N]):-conc(T,L,N).

add(X,L,[X|L]).

delete1(X,[X|T],T).
delete1(X,[Y|T],[Y,T1]):-delete1(X,T,T1).

/*sublist*/
 sublist1(S,L):-conc(L1,L2,L),conc(S,L3,L2).
/*
 *  sublist(S,[a,b,c]).
 *
 *  S = [] ;
S = [a] ;
S = [a, b] ;
S = [a, b, c] ;
S = [] ;
S = [b] ;
S = [b, c] ;
S = [] ;
S = [c] ;
S = [] ;
 *
 */


/*Permutation*/
permutation1([],[]).
permutation1([X|L],L2):-permutation(L,P),insert(X,P,L2).

permutation2([ ],[ ]).
permutation2(L,[X|P]):- delete(X,L,L1),permutation2(L1,P).



/*
 * sorting and merging lists
 *
 *Insertion sort
*/
insert(X,[ ],[X]).
insert(X,[H|T],[X,H|T]):-X=<H.
insert(X,[H|T],[H|N]):-X>H,insert(X,T,N).
insertsort([ ],[ ]).
insertsort([H|T],L):-insertsort(T,N),insert(H,N,L).

/*
 *Insertion sort
*/
exchangesort(L,Sorted):-swap(L,L1),exhangesort(L1,Sorted).
exchangesort(Sorted,Sorted). % List is already sorted
swap([X,Y|Rest],[Y,X|Rest]):-X>Y. % Swap 1st and 2nd
% elements.
swap([Z|Rest],[Z|Rest1]):-swap(Rest,Rest1).

/*
 *Quick sort
*/
quicksort([ ],[ ]).
quicksort([X|Tail],Sorted):-split(X,Tail,Small,Big),
quicksort(Small,SortedSmall),
quicksort(Big,SortedBig),
conc(SortedSmall,[X|SortedBig],Sorted).
split(X,[ ],[ ],[ ]).
split(X,[Y|Tail],[Y|Small],Big):- X>Y,!,
split(X,Tail,Small,Big).
split(X,[Y|Tail],Small,[Y|Big]):-split(X,Tail,Small,Big).
conc([ ],L,L).
conc([X|L1],L2,[X|L3]):-conc(L1,L2,L3).



/*
 *Merge sort
*/

mergsort([ ],[ ]).
mergsort([X],[X]).
mergsort(List,SortedList):-divide(List,List1,List2),
mergesort(List1,Sorted1),
mergesort(List2,Sorted2),
merge(Sorted1,Sorted2,SortedList).
divde([ ],[ ],[ ]).
divide([X],[X],[ ]).
divide([X,Y|L],[X|L1],[Y|L2]):-divide(L,L1,L2).
merge([ ],L,L).
merge([H|T],L,N):-insert(H,L,R), merge(T,R,N).
insert(X,[ ],[X]).
insert(X,[H|T],[X,H|T]):-X=<H.
insert(X,[H|T],[H|N]):-X>H, insert(X,T,N).


/*
 *appending and sorting
*/
append_merge(L1,L2,L):-conc(L1,L2,N),insertsort(N,L).


/*
 *Merge 2 lists
*/

ordinary-merge([ ],L,L).
ordinary-merge([H|T],L2,L):-insert(H,L2,N),
ordinary-merge(T,N,L).
