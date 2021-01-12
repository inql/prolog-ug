append2([X|L1],L2,[X|L3]) :- write(X), write(L1), write(L2), write(L3),nl, append2(L1,L2,L3).
append2([],L,L).   

% ?- append2(X,[3,4],[2,3,4]).
% X = [2]
% nie mam pojecia dlaczego
% a dobra, tutaj jest link https://inf.ug.edu.pl/~schwarzw/zadania/ProgLogZadanie8.pdf