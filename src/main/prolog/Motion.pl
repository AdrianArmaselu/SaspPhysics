#include('Utils.pl').
#include('Builtins.pl').

_solve(Goals, Params, SolutionSteps) :-
    _solve(Goals, Params, _, [], SolutionSteps).

%Base Case
_solve([], SolutionParams, SolutionParams, SolutionSteps, SolutionSteps).

%Solve each individual problem at a time recursively
_solve([Goal | RemainingGoals], Params, SolutionParams, Steps, SolutionSteps) :-
	_solve_subproblem(Goal, Params, ParamsWithGoalParams, Steps, StepsWithGoalSteps),
	_solve(RemainingGoals, ParamsWithGoalParams, SolutionParams, StepsWithGoalSteps, SolutionSteps).

%The question has already been answered
_solve_subproblem(Goal, Params, Params, Steps, [Goal | Steps]) :-
    _elaborate(Goal, GoalParam, _, _),
    _member(GoalParam, Params).

%Recursively answer the question by solving subquestions
_solve_subproblem(Goal, Params, SolutionParams, Steps, [Goal | StepsWithSubgoalSteps]) :-
    _not_revisited(Goal, Steps),
    _elaborate(Goal, _, Subgoals, _),
    _solve(Subgoals, Params, ParamsWithSubgoalParams, Steps, StepsWithSubgoalSteps),
    _compute_solution(Goal, ParamsWithSubgoalParams, SolutionParams).

_not_revisited(Goal, Steps) :- not _member(Goal, Steps).

_compute_solution(Goal, Params, [Solution | Params]) :-
    _elaborate(Goal, _, _, GoalParams),
    _members(GoalParams, Params),
    _resolve_goal(Goal, GoalParams, Solution).

% Total Time
_elaborate(
totalTime,
totalTime(TotalTime),
[h0, hx, gravity, v0y],
[h0(H0), hx(Hx), gravity(G), v0y(V0y)]
).

_resolve_goal(
totalTime,
[h0(H0), hx(Hx), gravity(G), v0y(V0y)],
totalTime(divide(sub(neg(V0y), sqrt(sub(pow(V0y, 2), multiply([2, G, sub(H0, Hx)])))), neg(G)))
) :- totalTime(divide(sub(neg(V0y), sqrt(sub(pow(v0y, 2), multiply([2, G, sub(H0, Hx)])))), neg(G))).

totalTime(X) :- not _not_totalTime(X).
_not_totalTime(X) :- not totalTime(X).

% V0Y
_elaborate(
v0y,
v0y(V0y),
[v0, theta],
[v0(V0), theta(Theta)]
).

_resolve_goal(
v0y,
[v0(V0), theta(Theta)],
v0y(multiply([V0,sin(Theta)]))
) :- v0y(multiply([V0,sin(Theta)])).

v0y(X) :- not _not_v0y(X).
_not_v0y(X) :- not v0y(X).

% h0
_elaborate(
h0,
h0(H0),
[],
[]
).

% hx
_elaborate(
hx,
hx(Hx),
[],
[]
).

% gravity
_elaborate(
gravity,
gravity(G),
[],
[]
).

% theta
_elaborate(
theta,
theta(Theta),
[],
[]
).

% v0
_elaborate(
v0,
v0(V0),
[],
[]
).

%?- write('lala'), solve(problem([h0(1), h(2), gravity(9.8), theta(45), v0(100)], [totalTime(X)]), Steps).
?- _solve([totalTime], [h0(1), hx(2), gravity(9.8), theta(45), v0(100)], Steps).


