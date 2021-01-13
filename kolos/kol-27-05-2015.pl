%siema kto pl
%kolokwium tutaj: https://inf.ug.edu.pl/~schwarzw/zadania/kol-27-05-2015.pdf

%zad 1
%a
member(X,[X|L]).
member(X,[Y|L]) :- member(X,L).
%b
member2(X,[X|_]).
member2(X,[Y|_]) :- member2(X,Y).
member2(X,[_|L]) :- member2(X,L).

/* zad2 */
%a
suffix(L1,L2) :- append(X,L1,L2).
%b
% just helper for palindrom
without_last([],[]).
without_last([X],[]).
without_last([X|L1],[X|L2]) :- without_last(L1,L2).

palindrom([]).
palindrom([X]).
palindrom([X,Y|L]) :- without_last([X|L],L1), palindrom(L1).

%wersja z reverse

palindrom2([]).
palindrom2(L) :- reverse(L,L).

/* zad 3 */

%a
split(X,[],[],[]).
split(X,[Y|L],[Y|L1],L2) :- Y=<X, split(X,L,L1,L2).
split(X,[Y|L],L1,[Y|L2]) :- Y>X, split(X,L,L1,L2).

%b
even(0).
even(X) :- X > 0, X1 is X - 1, odd(X1).
even(X) :- X < 0, X1 is X + 1, odd(X1).

odd(1).
odd(X) :- X > 0, X1 is X - 1, even(X1).
odd(X) :- X < 0, X1 is X + 1, even(X1).

split2(P,[],[],[]).
split2(P,[Y|L],[Y|L1],L2) :- call(P,Y), split2(P,L,L1,L2).
split2(P,[Y|L],L1,[Y|L2]) :- not(call(P,Y)), split2(P,L,L1,L2).

/*zad 4 */
tree1(t(6, t(4, t(2, nil, nil), t(5, nil, nil)), t(9, t(7, nil, nil), nil))).
%by wywołać: tree1(T), search(T,C).

%a
search(t(X,L,R),X).
search(t(Y,L,R),X) :- search(L,X) ; search(R,X).

%b
prod(t(X,nil,nil),X).
prod(t(Y,L,nil),X) :- prod(L,X2), X is Y * X2.
prod(t(Y,nil,R),X) :- prod(R,X1), X is Y * X1.
prod(t(Y,L,R),X) :- prod(L,X1), prod(R,X2), X is Y * X1 * X2.

%c
postorder(nil,[]).
postorder(t(X,L,R),P) :- postorder(L,P1), postorder(R,P2), append(P1, P2, PW), append(PW,[X], P).

/* zad 6 w pliczkach jpg*/
                            