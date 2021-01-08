f(1,one).
f(s(1),two).
f(s(s(1)),three).
f(s(s(s(X))),N) :- f(X,N).

% Jak odpowiada Prolog na pytanie
% f(s(1),A)? - "two", wywołanie f(s(1),two).
% f(s(s(1)),two)? - false, nie ma predykatu spełniającego wywołanie
% f(s(s(s(s(s(s(1)))))),C)? - one, f(s(s(s(s(s(s(1)))))),C) -> f(s(s(s(1))),C) -> f(1,C) -> one
% f(D,three)? - s(s(1)), do D przekazany zostaje argument s(s(1))