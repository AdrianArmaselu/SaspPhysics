compute(pow(Base, Exponent), Answer) :-
    compute(Base, BaseNumeric),
    compute(Exponent, ExponentNumeric),
    list(BaseNumeric, ExponentNumeric, Numbers),
    multiplyNumeric(Numbers, Answer),
    write(Answer), nl.

multiplyNumeric([H|T], Answer) :-
    multiplyNumeric(T, SubAnswer),
    Answer is SubAnswer * H.

multiplyNumeric([], 1).

compute(divide(Numerator, Denominator), Answer) :-
    compute(Numerator, NumeratorNumeric),
    compute(Denominator, DenominatorNumeric),
    Answer is NumeratorNumeric / DenominatorNumeric,
    !.

compute(multiply(Elements), Answer) :-
    multiply(Elements, Answer).

compute(neg(X), Answer) :-
    compute(X, XNumeric),
    Answer is -XNumeric,
    !.

compute(add(X, Y), Answer) :-
    Answer is X + Y,
    !.

compute(sub(X, Y), Answer) :-
    compute(X, XNumeric),
    compute(Y, YNumeric),
    Answer is XNumeric - YNumeric,
    !.

compute(sqrt(X), Answer) :-
    compute(X, XNumeric),
    Answer is sqrt(XNumeric),
    !.

list(X, N, L) :-
    length(L, N),
    maplist(=(X), L).

multiply([H|T], Answer) :-
    multiply(T, SubAnswer),
    compute(H, HNumeric),
    Answer is SubAnswer * HNumeric,
    !.

multiply([], 1).

compute(X, X) :- not(var(X)).
