#include('engine/SolverEngine.pl').
#include('topics/ParabolicMotion.pl').

?- _solve([totalTime], [h0(1), hx(2), gravity(9.8), theta(45), v0(100)], Steps), _debug(Steps).