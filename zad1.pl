member(X,[X|L]).
member(X,[Y|L]) :- member(X,L).

silnia(0,1).
silnia(X,N) :- X > 0,
               X1 is X - 1, silnia(X1,N1), N is X * N1.

factorial(0,1). 

factorial(N,F) :- N>0, 
                N1 is N-1, factorial(N1,F1), F is N * F1.

fib(0,1).
fib(1,1).
fib(X,N) :- X > 1,
            X1 is X - 1, X2 is X - 2, 
            fib(X1,N1), fib(X2,N2), N is N1 + N2.

gcd(X,0,X).
gcd(N,M,P) :- M1 is N mod M, gcd(M,M1,P).