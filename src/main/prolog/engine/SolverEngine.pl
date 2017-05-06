#include('../utils/Utils.pl').
#include('../utils/Builtins.pl').

_solve(Goals, Steps, SolutionSteps) :-
    _solve(Goals, Steps, SolutionSteps).

%Base Case
_solve([], SolutionSteps, SolutionSteps).

%Solve each individual problem at a time recursively
_solve([Goal | RemainingGoals], Steps, SolutionSteps) :-
	_solve_subproblem(Goal, Steps, StepsWithGoalSteps),
	_solve(RemainingGoals, StepsWithGoalSteps, SolutionSteps).

%The question has already been answered
_solve_subproblem(Goal, Steps, Steps) :-
    _member(Goal, Steps).

%Recursively answer the question by solving subquestions
_solve_subproblem(Goal, Steps, [Solution | StepsWithSubgoalSteps]) :-
    _not_revisited(Goal, Steps),
    _specification(Goal, Subgoals, _, _),
    _solve(Subgoals, Steps, StepsWithSubgoalSteps),
    _compute_solution(Goal, Subgoals, StepsWithSubgoalSteps, Solution).

%Sometimes a step is needed but does not exist
_solve_subproblem(Goal, Steps, [Formula | Steps]) :-
    _specification(Goal, _, Formula, _).

_not_revisited(Goal, Steps) :- not _member(Goal, Steps).

_compute_solution(Goal, Subgoals, Steps, Solution) :-
    _members(Subgoals, Steps),
    _specification(Goal, Subgoals, _, Solution).
