#include('engine/SolverEngine.pl').
#include('topics/Forces.pl').
#include('topics/BasicMotionScenarios.pl').
#include('topics/TopicPrototype.pl').
_numeric_processing(enabled).

?- _solve([txmax(projectile, X)],
[h0(projectile, 1), hx(projectile, 2), gravity(projectile, 9.8), theta(projectile, 45), v0(projectile, 1)]).
%?- _solve([txmax(projectile, X)], [x(projectile, 100), vx(projectile, 10)]).
%?- _solve([ymax(projectile, ymax)], [gravity(projectile, 9.8), v0(projectile, 10), theta(projectile, 10), h0(projectile, 0)]).

%?- _solve([force(projectile, X), force(projectile2, Y)],
  %      [mass(projectile, 10), acceleration(projectile, 9.8),
  %      mass(projectile2, 90), acceleration(projectile2, 9.8)]).


%?- _solve([friction_force(box, X)], [mass(box, 90), gravity(box, 9.8), miu(box, 90)]).

%?- _solve([force(projectile, X)], [mass(projectile, 90), acceleration(projectile, 9.8)]).