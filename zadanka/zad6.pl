last([X],X).
last([Y|L],X) :- last(L,X).

delete(X,[],[]).
delete(X,[X|L],L).
delete(X,[Y|L1],[Y|L2]) :- delete(X,L1,L2).

% tylko że to rozwiązania sprawdza pierwsze trzy i takie samo jest na stronie z rozwiązaniami
delete([X,Y,Z|L],L).

accReverse([H|T],A,R):- accReverse(T,[H|A],R).
accReverse([],A,A).
reverse(L1,L2):- accReverse(L1,[],L2).

evenlength([]).
evenlength([X,Y|L]):-evenlength(L).

oddlength([X]).
oddlength([X,Y|L]):-oddlength(L).

shift([],[]).
shift([X|L1],L2) :- append(L1,[X],L2).

quadrat([],[]).
quadrat([X|L1],[Y|L2]) :- Y is X*X, quadrat(L1,L2).

combine([],L,[]).
combine(L,[],[]).
combine([X|L1],[Y|L2],[[X,Y]|L3]):- combine(L1,L2,L3).

% just helper for palindrom
without_last([],[]).
without_last([X],[]).
without_last([X|L1],[X|L2]) :- without_last(L1,L2).

palindrom([]).
palindrom([X]).
palindrom([X,Y|L]) :- without_last([Y|L],L1), palindrom(L1).

p(X,L,Y,Z) :- append(L1,[Y,X,Z|L2],L).

q(X,L1,L2) :- append(L3,[X,X|L4],L1), append(L3,[X,X],L2).