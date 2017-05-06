#include('engine/SolverEngine.pl').
#include('topics/ParabolicMotion.pl').

?- _solve([totalTime(X)], [h0(1), hx(2), gravity(9.8), theta(45)]).