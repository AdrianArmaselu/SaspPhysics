angle(X).
time(X).
v0(X).

% these come first.
time(0).
v0(0).
gravity(9.8).

solve(facts, isTime(X)):-
	_stateFacts(facts).

_stateFacts([]).
_stateFacts(facts([Fact|RemainingFacts])) :-
		_stateFact(Fact),
		_stateFacts(RemainingFacts).

_stateFact(v0(X)) :- v0(X).
_stateFact(time(X)) :- time(X).
_stateFact(angle(X)) :- angle(X).

_computeSpeed(distance(D), time(T)) :-
	X is D / T,
	time(T),
	speed(X).

_computeDistance(speed(S), time(T)) :-
	D is T / S,
	time(T),
	distance(D).

v0y(V0, Theta, multiply([V0,sin(Theta)])) :- Theta \= 0.
v0x(V0, Theta, multiply([V0,cos(Theta)])) :- Theta \= 90.

totalTime(V0, Theta, H0, H, divide(sub(neg(V0y), sqrt(sub(pow(V0y, 2), multiply([2, G, sub(H0, H)])))), neg(G))) :- gravity(G), v0y(V0, Theta, V0y).
totalTime(V0, Theta, H0, H, divide(add(neg(V0y), sqrt(sub(pow(V0y, 2), multiply([2, G, sub(H0, H)])))), neg(G))) :- gravity(G), v0y(V0, Theta, V0y).

solve(facts(Facts), questions(Questions)) :-


maxHeight(V0, Theta, Hmax, T, Distance) :-
	v0y(V0, Theta, V0y),
	gravity(G).

_debug([]) :- nl.
_debug([Arg|Arguments]):-
	write(Arg), write(' '),
	_debug(Arguments).

%?- _computeDistance(speed(25), time(250)).
%?- solve(facts([time(250)]), isTime(X)).
?- totalTime(100,45,120,50, X).
