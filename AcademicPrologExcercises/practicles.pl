parent_of(tom,bob).
parent_of(pam,bob).
parent_of(tom,liz).
parent_of(bob,ann).
parent_of(bob,pat).
parent_of(pat,jim).

%parent_of(tom,bob)----tom is the parent of bob? (true/false)
%parent_of(X,bob)----who is the parent of bob
%parent_of(tom,Y)----who is the toms child
%parent_of(X,Y)-----whose parent is who


%
%parent_of(Y,jim),parent_of(X,Y).---grand parent of jim
%parent_of(Grandparent,Parent),parent_of(Parent,jim)---grand parent of jim
%parent_of(tom,X),parent_of(X,Y).---grand children of tom
%parent_of(tom,Son),parent_of(Son,Grandson)---grandchildren of tom
%parent_of(Y,Z),parent_of(X,Y).----somones grandparent
%
%
%parent_of(X,pat),parent_of(X,ann).----common parent of some ones


/*offspring -opasite of the relationship
 * no need to type same thing again
 *
*/
/* head of rule     body of the rule*/
offspring_of(Y,X):-parent_of(X,Y). /* condition = body
                                      conclusion = head */
/* offspring_of(liz,tom) -- liz is the toms offspring
 * offspring_of(tom,liz
 * parent_of(tom,liz)
                                      */
/* when variable has assigned value = instanciate */

female(pam).
female(liz).
female(pat).
female(ann).
male(tom).
male(bob).
male(jim).

mother_of(X,Y):-parent_of(X,Y),female(X).
father_of(X,Y):-parent_of(X,Y),male(X).

sister_of(X,Y):-
    parent_of(Z,Y),
    parent_of(Z,X),
    female(X),
    dif(X,Y).
brother_of(X,Y):-
    parent_of(Z,Y),
    parent_of(Z,X),
    male(X),
    dif(X,Y).

/*find ancesters using recursive */
ancester_of(X,Z):-parent_of(X,Z).
%X is ancester of Z
ancester_of(X,Z):-parent_of(X,Y),ancester_of(Y,Z).
%X is ancester of Z

/* constant --- numbers / atoms
 *  atoms ---- string of letter/ string of special chharacters/ string
 *  of characters enclose single quotation mark*/

/*compound terms:FUNCTOR
 * ex: parent_of (pam,bob)
 * argument of FUNCTOR = arity
 */
