#include('engine/SolverEngine.pl').
#include('topics/ParabolicMotion.pl').

?- _solve([txmax(X)], [h0(1), hx(2), gravity(9.8), theta(45), v0(1)]).
%?- _solve([txmax(X)], [x(100), vx(10)]).
%?- _solve([ymax(ymax)], [gravity(9.8), v0(10), theta(10), h0(0)]).