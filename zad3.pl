value(i,1).
value(v,5).
value(x,10).
value(l,50).
value(c,100).
value(d,500).
value(m,1000).

rzym([],0).
rzym([X],N)     :- value(X,N).
rzym([X,Y|L],N) :- value(X,U), value(Y,V), U < V,
                   rzym([Y|L],N1), N is N1 - U.
rzym([X,Y|L],N) :- value(X,U),
                   rzym([Y|L],N1), N is N1 + U.