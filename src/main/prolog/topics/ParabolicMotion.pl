
%%%%%% Total Time %%%%%%
_specification(
totalTime(TotalTime),
[h0(H0), hx(Hx), gravity(G), v0y(V0y)],
totalTime(divide(sub(neg(v0y(V0y)), sqrt(sub(pow(v0y(V0y), 2), multiply([2, gravity(G), sub(h0(H0), hx(Hx))])))), neg(gravity(G)))),
totalTime(divide(sub(neg(V0y), sqrt(sub(pow(V0y, 2), multiply([2, G, sub(H0, Hx)])))), neg(G)))
).

totalTime(X) :- not _not_totalTime(X).
_not_totalTime(X) :- not totalTime(X).

%%%%%% V0Y %%%%%%
_specification(
v0y(V0y),
[v0(V0), theta(Theta)],
v0y(multiply([v0(V0),sin(theta(Theta))])),
v0y(multiply([v0(V0),sin(theta(Theta))]))
).

v0y(X) :- not _not_v0y(X).
_not_v0y(X) :- not v0y(X).

%%%%%% h0 %%%%%%
_specification(
h0(H0),
[],
Undefined,
[h0(H0)]
).
h0(X) :- not _not_h0(X).
_not_h0(X) :- not h0(X).

%%%%%% hx %%%%%%
_specification(
hx(Hx),
[],
Undefined,
[]
).

hx(X) :- not _not_hx(X).
_not_hx(X) :- not hx(X).

%%%%%% gravity %%%%%%
_specification(
gravity(G),
[],
Undefined,
[]
).

gravity(X) :- not _not_gravity(X).
_not_gravity(X) :- not gravity(X).

%%%%%% theta %%%%%%
_specification(
theta(Theta),
[],
Undefined,
[]
).

theta(X) :- not _not_theta(X).
_not_theta(X) :- not theta(X).

%%%%%% v0 %%%%%%
_specification(
v0(V0),
[],
Undefined,
Undefined
).

v0(X) :- not _not_v0(X).
_not_v0(X) :- not v0(X).



