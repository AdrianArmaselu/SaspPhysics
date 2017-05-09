#include('engine/SolverEngine.pl').
#include('topics/BasicMotion.pl').
#include('topics/ParabolicMotion.pl').
#include('topics/BasicMotionScenarios.pl').

%?- _solve([will_trains_collide(train1, train2, WTC)], [d(train1, 100), d(train2, 50), s(train1, 100), s(train2, 20)]).
%?- _solve([downstream_time(boat, river, DT)], [s(boat, 100), s(river, 70), t(boat, 4)]).
%?- _solve([upstream_time(boat, river, DT)], [s(boat, 100), s(river, 70), t(boat, 2)]).
%?- _solve([downstream_time1(boat, river, DT1)], [d(boat, 100), s(boat, 100), s(river, 70)]).
%?- _solve([upstream_time1(boat, river, DT1)], [d(boat, 100), s(boat, 100), s(river, 70)]).
%?- _solve([t(train, T)], [s(train, 100), d(train, 100)]).
%?- _solve([s(train, S)], [t(train, 100), d(train, 100)]).
%?- _solve([d(train, D)], [t(train, 100), s(train, 100)]).
%?- _solve([meeting_time1(train1, train2, MT1)], [d(train1, train2, 100), s(train1, 20), s(train2, 25)]).
%?- _solve([meeting_time2(train1, train2, MT2)], [d(train1, train2, 100), s(train1, 20), s(train2, 25)]).
%?- _solve([distance_bird(train1, train2, bird, DB)], [d(train1, train2, 100), s(train1, 50), s(train2, 20), s(bird, 10)]).
?- _solve([projectile_time(projectile, PT)], [v0(projectile, 10), theta(projectile, 30), h0(projectile, 10), h1(projectile, 5), g(projectile, 10)]).
%?- _solve([vertical_displacement1(projectile, VD1)],[v0(projectile, 10), v1(projectile, 20), g(projectile, 10)]).
%?- _solve([vertical_displacement2(projectile, VD2)], [v0(projectile, 10), theta(projectile, 30), t(projectile, 10), g(projectile, 10)]).