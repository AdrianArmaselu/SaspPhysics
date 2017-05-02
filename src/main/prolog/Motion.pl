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

%The question has already been answered
solve(problem(Facts, totalTime), _, ProblemSteps, ProblemSteps, Facts) :-
    _member(totalTime(TotalTime), Facts).

%Recursively answer the question by solving subproblems
solve(problem(Facts, Question), CurrentSteps, [Answer | SolvedSteps], FinalFacts) :-
    not _member(Question, CurrentSteps),
    sub_questions(Question, SubQuestions),
    solve(problem(Facts, SubQuestions), CurrentSteps, SolvedSteps, UpdatedFacts),
	answer(Question, SubQuestions, Answer),
	update(UpdatedFacts, Answer, FinalFacts).

sub_questions(totalTime, [v0(V0), theta(Theta), h0(H0), h(H), gravity(G), v0y(V0y)]).

answer(
totalTime,
[v0(V0), theta(Theta), h0(H0), h(H), gravity(G), v0y(V0y)],
totalTime(divide(sub(neg(V0y), sqrt(sub(pow(V0y, 2), multiply([2, G, sub(H0, H)])))), neg(G)))
).

update(Facts, NewFact, [NewFact|Facts]).
