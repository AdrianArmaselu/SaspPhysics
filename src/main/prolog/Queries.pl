#include('engine/SolverEngine.pl').
#include('topics/Forces.pl').
#include('topics/BasicMotionScenarios.pl').
#include('topics/TopicPrototype.pl').
_numeric_processing(enabled).

% find the time it takes the projectile to hit the ground based on height, speed, angle, and gravity
?- _solve([txmax(projectile, X)],
[h0(projectile, 1), hx(projectile, 2), gravity(projectile, 9.8), theta(projectile, 45), v0(projectile, 1)]).

% fint the time it takes the projectile to hit the ground based on distance covered and horizontal speed
?- _solve([txmax(projectile, X)], [x(projectile, 100), vx(projectile, 10)]).

% should return false since not all the needed parameters are there to answer this question
?- _solve([ymax(projectile, ymax)], [gravity(projectile, 9.8), v0(projectile, 10), theta(projectile, 10), h0(projectile, 0)]).

% find the forces for both objects based on mass and acceleration of each
?- _solve([force(projectile, X), force(projectile2, Y)],
        [mass(projectile, 10), acceleration(projectile, 9.8),
        mass(projectile2, 90), acceleration(projectile2, 9.8)]).

% find friction force based on mass, gravity and coefficient
?- _solve([friction_force(box, X)], [mass(box, 90), gravity(box, 9.8), miu(box, 90)]).
