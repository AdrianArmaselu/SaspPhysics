% Total Time

_elaborate(
totalTime,
totalTime(TotalTime),
[h0, hx, gravity, v0y],
[h0(H0), hx(Hx), gravity(G), v0y(V0y)]
).

_resolve_goal(
totalTime,
[h0(H0), hx(Hx), gravity(G), v0y(V0y)],
totalTime(divide(sub(neg(V0y), sqrt(sub(pow(V0y, 2), multiply([2, G, sub(H0, Hx)])))), neg(G)))
).

totalTime(X) :- not _not_totalTime(X).
_not_totalTime(X) :- not totalTime(X).

% V0Y
_elaborate(
v0y,
v0y(V0y),
[v0, theta],
[v0(V0), theta(Theta)]
).

_resolve_goal(
v0y,
[v0(V0), theta(Theta)],
v0y(multiply([V0,sin(Theta)]))
).

v0y(X) :- not _not_v0y(X).
_not_v0y(X) :- not v0y(X).

% h0
_elaborate(
h0,
h0(H0),
[],
[]
).

h0(X) :- not _not_h0(X).
_not_h0(X) :- not h0(X).

% hx
_elaborate(
hx,
hx(Hx),
[],
[]
).

hx(X) :- not _not_hx(X).
_not_hx(X) :- not hx(X).

% gravity
_elaborate(
gravity,
gravity(G),
[],
[]
).

gravity(X) :- not _not_gravity(X).
_not_gravity(X) :- not gravity(X).

% theta
_elaborate(
theta,
theta(Theta),
[],
[]
).

theta(X) :- not _not_theta(X).
_not_theta(X) :- not theta(X).

% v0
_elaborate(
v0,
v0(V0),
[],
[]
).

v0(X) :- not _not_v0(X).
_not_v0(X) :- not v0(X).



