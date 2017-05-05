#include('../utils/Utils.pl').
#include('../utils/Builtins.pl').

_solve(Goals, Params, SolutionSteps) :-
    _solve(Goals, Params, _, [], SolutionSteps).

%Base Case
_solve([], SolutionParams, SolutionParams, SolutionSteps, SolutionSteps).

%Solve each individual problem at a time recursively
_solve([Goal | RemainingGoals], Params, SolutionParams, Steps, SolutionSteps) :-
	_solve_subproblem(Goal, Params, ParamsWithGoalParams, Steps, StepsWithGoalSteps),
	_solve(RemainingGoals, ParamsWithGoalParams, SolutionParams, StepsWithGoalSteps, SolutionSteps).

%The question has already been answered
_solve_subproblem(Goal, Params, Params, Steps, [GoalParam | Steps]) :-
    _elaborate(Goal, GoalParam, _, _),
    _member(GoalParam, Params).

%Recursively answer the question by solving subquestions
_solve_subproblem(Goal, Params, SolutionParams, Steps, [Solution | StepsWithSubgoalSteps]) :-
    _not_revisited(Goal, Steps),
    _elaborate(Goal, _, Subgoals, _),
    _solve(Subgoals, Params, ParamsWithSubgoalParams, Steps, StepsWithSubgoalSteps),
    _compute_solution(Goal, ParamsWithSubgoalParams, SolutionParams, Solution).

_not_revisited(Goal, Steps) :- not _member(Goal, Steps).

_compute_solution(Goal, Params, [Solution | Params], Solution) :-
    _elaborate(Goal, _, _, GoalParams),
    _members(GoalParams, Params),
    _resolve_goal(Goal, GoalParams, Solution).