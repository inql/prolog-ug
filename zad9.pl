permutation([],[]).
permutation(L,[X|P]) :- append(U,[X|V],L),
                        append(U,V,W),
                        permutation(W,P).