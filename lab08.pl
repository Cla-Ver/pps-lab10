succ(X, s(X)).

sum(X, zero, X).
sum(zero, X, X).
sum(X, s(Y), s(O)) :- sum(X, Y, O).

mul(X, zero, zero).
mul(X, s(Y), O) :- mul(X, Y, W), sum(X, W, O).

factorial(zero, s(zero)).
factorial(s(N), O) :- factorial(N, Temp), mul(s(N), Temp , O).

greater(s(N), zero).
greater(s(N), s(M)) :- greater(N, M).

%Prende un elemento E e una lista, e dice se E è nella lista
element(E, cons(E, _)).
element(E, cons(_, T)) :- element(E, T).

% ---- Esercizi Lab ----

a(1).
a(X) :- b(X), b(X).
b(1).
b(2).
c(X) :- b(X).
c(X) :- b(X), c(X).

search(X, cons(X, _)).
search(X, cons(_, Xs)) :- search(X, Xs).

search2(X, cons(X, cons(X, _))).
search2(X, cons(_, Xs)) :- search2(X, Xs).

search_two(X, cons(X, cons(Y, cons(X, _)))).
search_two(X, cons(_, Xs)) :- search_two(X, Xs).

search_anytwo(X, cons(X, Xs)) :- search(X, Xs).
search_anytwo(X, cons(_, Xs)) :- search_anytwo(X, Xs).

size(nil, zero).
size(cons(_, T), s(N)) :- size(T, N).

sum_list(nil, zero).
sum_list(cons(H, T), S) :- sum_list(T, Temp), sum(H, Temp, S).

count(List, E, N) :- count(List, E, zero, N).
count(nil, E, N, N).
count(cons(E, L), E, N, M) :- count(L, E, s(N), M).
count(cons(E, L), E2, N, M) :- E \= E2, count(L, E2, N, M).

max(cons(H, T), Max) :- max(T, H, Max).
max(nil, Max, Max).
max(cons(H, T), TempMax, Max) :- greater(TempMax, H), max(T, TempMax, Max).
max(cons(H, T), TempMax, Max) :- greater(H, TempMax) ; H == TempMax, max(T, H, Max).

min-max(cons(H, T), Min, Max) :- min-max(T, H, H, Min, Max).
min-max(nil, Min, Max, Min, Max).
min-max(cons(H, T), TempMin, TempMax, Min, Max) :- greater(H, TempMax), min-max(T, TempMin, H, Min, Max).
min-max(cons(H, T), TempMin, TempMax, Min, Max) :- greater(TempMin, H), min-max(T, H, TempMax, Min, Max).
min-max(cons(H, T), TempMin, TempMax, Min, Max) :- greater(TempMax, H) ; TempMax == H, greater(H, TempMin) ; TempMin == H, min-max(T, TempMin, TempMax, Min, Max).

same(nil, nil).
same(cons(H, T1), cons(H, T2)) :- same(T1, T2).

all_bigger(nil, nil).
all_bigger(cons(H1, T1), cons(H2, T2)) :- greater(H1, H2), all_bigger(T1, T2).

sublist(nil, _).
sublist(cons(H, T), List2) :- search(H, List2), sublist(T, List2).
