/*
t binarne D jest albo pusty (repezentowane przez nil) albo zawiera element X i dwa poddrzewa L i P (reprezentowane przez t(X,L,P)).
Proszę zdefiniować następujące predykaty dla drzew.

size(D,N), który jest spełniony, jeżeli N jest ilością elementów drzewa D.
search(D,N), który jest spełniony, jeżeli N jest elementem drzewa D.
max_tree(D,N), który jest spełniony, jeżeli N jest maximum elementów w drzewie D.
times(N,D1,D2), który bierzy wszystkie wartości węzłów drzewa D1 razy N.
preorder(D,L), który jest spełniony, jeżeli lista L zawiera elementy drzewa D w kolejności prefiksowym.
subtree(D1,D2), który jest spełniony, jeżeli t D1 jest poddrzewem drzewa D1.
subst(D1,D2,D3,D4), który jest spełniony, jeżeli t D4 jest drzewem D2, w którym wszystkie poddrzewa D1 zostały zmienione na t D4.
*/

size(nil,0).
size(t(X,L,R),N) :- size(L,N1), size(R,N2), N is 1 + N1 + N2.

search(t(X,L,R),X).
search(t(Y,L,R),X) :- search(L,X); search(R,X).


% to nie działa : (

max_tree(t(X,nil,nil),X).
max_tree(t(X,L,nil),M) :- max_tree(L,M1), maximum(X,M1,M).
max_tree(t(X,nil,R),M) :- max_tree(R,M1), maximum(X,M1,M).
max_tree(t(X,L,R),M)   :- max_tree(L,M1), max_tree(R,M2), maximum(X,M1,M2,M).

times(N,nil,nil).
times(N,t(X1,L1,R1),t(X2,L2,R2)) :- X2 is N * X1,
                                        times(N,L1,L2), times(N,R1,R2).

preorder(nil,[]).
preorder(t(X,L,R),P) :- preorder(L,P1), preorder(R,P2),
                            append([X|P1],P2,P).

subtree(nil,D).
subtree(t(X,L1,R1),t(X,L2,R2)) :-subtree(L1,R1), subtree(L2,R2).
subtree(t(X,L1,R1),t(Y,L2,R2)) :-
               subtree(t(X,L1,R1),L2) ; subtree(t(X,L1,R1),R2).

subst(D1,nil,D3,nil). 
subst(D1,D1,D3,D3).
subst(D1,drzewo(X,D1,R),D3,drzewo(X,D3,D)) :- subst(D1,R,D3,D).
subst(D1,drzewo(X,L,D1),D3,drzewo(X,D,D3)) :- subst(D1,R,D3,D).
subst(D1,drzewo(X,L1,D1),D3,drzewo(X,D4,D5)) :-
                        subst(D1,L,D3,D4), subst(D1,R,D3,D5).
                                     


% test case
% by wywołać
% tree1(T), size(T,C).
tree1(t(6, t(4, t(2, nil, nil), t(5, nil, nil)), t(9, t(7, nil, nil), nil))). 