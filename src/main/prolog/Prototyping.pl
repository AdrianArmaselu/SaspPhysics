angle(X).
v0(X).
v0y(X).
totalTime(X).

% these come first.
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

solve(problem(_, []), []).

solve(problem(Facts, [ Question | RemainingQuestions])) :-
	solve(problem(Facts, Question)),
	solve(problem(Facts, RemainingQuestions)).

solve(problem(Facts, totalTime), UpdatedFacts) :-
	_members([v0(V0), theta(Theta), h0(H0), h(H), gravity(G), v0y(V0y)], Facts),
	update(Facts, totalTime(divide(sub(neg(V0y), sqrt(sub(pow(V0y, 2), multiply([2, G, sub(H0, H)])))), neg(G))), UpdatedFacts).

update(Facts, NewFact, [NewFact|Facts]).

solve([Question |Questions]) :-
	solve(Question),
	solve(Questions).

solve(totalTime):-
	v0(V0),
	totalTime(TotalTime).

totalTime(TotalTime) :- not _not_totalTime(TotalTime).


assertUniverse([time(X)]) :-
	time(X).

maxHeight(V0, Theta, Hmax, T, Distance) :-
	v0y(V0, Theta, V0y),
	gravity(G).

_members([], Ys).
_members([X | T], Ys) :-
	_member(X, Ys),
	_members(T, Ys).
_member(X, [X|_]).
_member(X, [_|Tail]) :-
  _member(X, Tail).

check(X) :-
	time(X).

predicateWithManyParams(
Lala1,
Lala2,
Lala3
).

time(X) :- not _not_time(X).
_not_time(X) :- not time(X).

_debug([]) :- nl.
_debug([Arg|Arguments]):-
	write(Arg), write(' '),
	_debug(Arguments).

	_append([],X,X).
    _append([X|Y],Z,[X|W]) :- _append(Y,Z,W).

%?- _computeDistance(speed(25), time(250)).
%?- solve(facts([time(250)]), isTime(X)).
%?- totalTime(1,2,3,4, X).
%?- solve(problem([v0(1), theta(2), h0(3), h(4), gravity(9.8), v0y(10)], totalTime), X).
%?- _members([v0(V0), theta(Theta), h0(H0), h(H), gravity(G), v0y(V0y)], [v0(1), theta(2), h0(3), h(4), gravity(9.8), v0y(10)]).
%?- check(X).
?-_append([1,2,3], [4,5,6], X).
