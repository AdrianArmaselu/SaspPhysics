#include('Utils.pl')
#include('Builtins.pl')

%TODO: THE NAMING CONVENTIONS CAN BE IMPROVED

solve(Problem, Solution) :-
    solve(Problem, AccumulatedFacts, [], Solution).

solve(problem(_, []), []).

solve(
problem(Facts, [Question | RemainingQuestions]),
[AccumulatedFacts | AllAccumulatedFacts],
InCalculationSequence,
[OutCalculationSequence | FinalCalculationSequence],
Solution
) :-
	solve(problem(Facts, Question), AccumulatedFacts, InCalculationSequence, OutCalculationSequence, Solution),
	solve(problem(AccumulatedFacts, RemainingQuestions), OutCalculationSequence, FinalCalculationSequence, AllAccumulatedFacts).

% Total Time Predicates
% Required facts:
% v0 - initial velocity
% theta - angle with the horizontal
% h0 - initial height
% h - height at any given time
% gravity -
% v0y - initial vertical velocity

%The question has already been answered
solve(problem(Facts, totalTime), _, InCalculationSequence, InCalculationSequence, Facts) :-
    _member(totalTime(TotalTime), Facts).

%Answer the question if there are sufficient facts to do so
% if no steps are repeated, then the answer can be computed
solve(problem(Facts, totalTime), InCalculationSequence, [totalTime | OutCalculationSequence], UpdatedFacts) :-
    steps(totalTime, Steps),
    variables(totalTime, Variables),
    not _members(Steps, InCalculationSequence),
	_members(Variables, Facts),
	answer(totalTime, Variables, Answer)
	update(Facts, Answer, UpdatedFacts).

%Compute the necessary facts to answer the question
solve(problem(Facts, totalTime), InCalculationSequence, [v0(V0), theta(Theta), h0(H0), h(H), gravity(G), v0y(V0y) | OutCalculationSequence], UpdatedAccumulatedFacts) :-
    not _members([v0(V0), theta(Theta), h0(H0), h(H), gravity(G), v0y(V0y)], InCalculationSequence).
    solve(problem(Facts, [v0, theta, h0, h, gravity, v0y]), AccumulatedFacts),
    update(AccumulatedFacts, totalTime(divide(add(neg(V0y), sqrt(sub(pow(V0y, 2), multiply([2, G, sub(H0, H)])))), neg(G))), UpdatedAccumulatedFacts).

variables(totalTime, [v0(V0), theta(Theta), h0(H0), h(H), gravity(G), v0y(V0y)]).
steps(totalTime, [v0, theta, h0, h, gravity, v0y]).

answer(
totalTime,
[v0(V0), theta(Theta), h0(H0), h(H), gravity(G), v0y(V0y)],
totalTime(divide(sub(neg(V0y), sqrt(sub(pow(V0y, 2), multiply([2, G, sub(H0, H)])))), neg(G)))
).

%V0y predicates

solve(problem(Facts, v0y), Facts) :-
    _member(v0y(V0y), Facts).

solve(problem(Facts, v0y), UpdatedFacts) :-
	_members([v0(V0), theta(Theta)], Facts),
	update(Facts, multiply([V0,sin(Theta)]), UpdatedFacts).

% we reach a cycle when solving necessitates a fact that is a question

update(Facts, NewFact, [NewFact|Facts]).
