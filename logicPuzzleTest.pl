
/**
The criminal is one of A, B, C and D.

A says: "It's not me"
B says: "It's D"
C says: "It's B"
D says: "It's not me"
And we know that only one of them tells the truth.
*/
criminal(K):-
	member(K,[a,b,c,d]),
    (K\=a -> A=1;A=0),
    (K=d  -> B=1;B=0),
    (K=b  -> C=1;C=0),
    (K\=d -> D=1;D=0),
    A+B+C+D=:=1.

/*
Stacey, Carla, Julia and Rose want to take seats in a cinema. 
There is only 1 isle seat and the rest are in a line next to it. 
If Rose want to sit in the isle seat, Julia wants to sit next to Stacey, 
and Carla doesn’t want to sit next to Julia, how will they sit (starting at the isle)?
*/
seats(X):-
    permutation([s,c,j,r], X),
    rose_isle(X),
    (my_sublist([j,s], X) ; my_sublist([s,j], X)),
	(not(my_sublist([c, j], X)), not(my_sublist([j, c], X))).
rose_isle([X|_]) :- 
	X == r.
my_sublist( Sublist, List ) :-
    append( [_, Sublist, _], List ).

/*
Michael, John, Tanya and Robert are putting together a band. 
They need a singer, a bass player, a drummer and a guitarist. 
If Tanya can play the bass and sing, Michael can sing and drum,
 Robert and drum and play the guitar, and John can play the guitar, 
 which of these arrangements make sense?
*/
people([michael, robert, tanya, john]).
musicT([sing, bass, drum, guitar]).
plays(michael, sing).
plays(michael, drum).
plays(robert, guitar).
plays(robert, drum).
plays(tanya, sing).
plays(tanya, bass).
plays(john, guitar).
band(Band):-
    plays(michael, M),
    plays(robert, R),
    plays(tanya, T),
    plays(john, J),
    musicT(I),
    equal([M,R,T,J], I),
    equal([M,R,T,J], Band).
isSubset([],_).
isSubset([H|T],Y):-
    member(H,Y),
    select(H,Y,Z),
    isSubset(T,Z).
equal(X,Y):-
    isSubset(X,Y),
    isSubset(Y,X).




