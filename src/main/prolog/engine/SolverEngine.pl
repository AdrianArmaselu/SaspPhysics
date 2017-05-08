#include('../utils/Utils.pl').
#include('../utils/Builtins.pl').

_solve(Goals, Steps) :-
    _solve(Goals, Steps, SolutionSteps),
    solution(SolutionSteps).

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
    _specification(subgoals, Goal, Subgoals),
    _solve(Subgoals, Steps, StepsWithSubgoalSteps),
    _compute_solution(Goal, Subgoals, StepsWithSubgoalSteps, Solution).

%Avoid circular problem solving
_not_revisited(Goal, Steps) :- not _member(Goal, Steps).

%Resolve Final Answer
_compute_solution(Goal, Subgoals, Steps, Solution) :-
    _members(Subgoals, Steps),
    _specification(solution, Goal, Subgoals, Solution).

solution(S) :- not _not_solution(S).
_not_solution(S) :- not solution(S).