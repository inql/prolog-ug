accNth(N,[X|L],X,N).
accNth(N,[A|L],X,C) :- C1 is C + 1, accNth(N,L,X,C1).

nth(N,L,X) :- C is 1, accNth(N,L,X,C).

ordered([]).
ordered([X]).
ordered([X,Y|L]):- X=<Y, ordered([Y|L]).

mergesort([],[]).    /* covers special case */
mergesort([A],[A]).
mergesort([A,B|R],S) :-  
   split([A,B|R],L1,L2),
   mergesort(L1,S1),
   mergesort(L2,S2),
   mymerge(S1,S2,S).
 
split([],[],[]).
split([A],[A],[]).
split([A,B|R],[A|Ra],[B|Rb]) :-  split(R,Ra,Rb).
 
mymerge(A,[],A).
mymerge([],B,B).
mymerge([A|Ra],[B|Rb],[A|M]) :-  A =< B, mymerge(Ra,[B|Rb],M).
mymerge([A|Ra],[B|Rb],[B|M]) :-  A > B,  mymerge([A|Ra],Rb,M).