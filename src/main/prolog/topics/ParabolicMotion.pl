
%%%%%% Total Time %%%%%%
%totalTime =

_specification(
totalTime(TotalTime),
[h0(H0), hx(Hx), gravity(G), v0y(V0y)],
totalTime(divide(sub(neg(v0y), sqrt(sub(pow(v0y, 2), multiply([2, gravity, sub(h0, hx)])))), neg(gravity))),
totalTime(divide(sub(neg(V0y), sqrt(sub(pow(V0y, 2), multiply([2, G, sub(H0, Hx)])))), neg(G)))
).

%%%%%% Max Height %%%%%%
% h = -gt/2 + h0

_specification(
ymax(YMax),
[gravity(G), thmax(Thmax), h0(H0)],
ymax(undefined),
yMax(add(neg(divide(multiply([G,Thmax]), 2)), H0))
).

%%%%%% thmax: Maximum Height Time %%%%%%
% t = V0y / g

_specification(
thmax(Thmax),
[v0y(V0y), gravity(G)],
thmax(undefined),
thmax(divide(V0y, G))
).

%%%%%% V0Y %%%%%%
_specification(
v0y(V0y),
[v0(V0), theta(Theta)],
v0y(multiply([v0,sin(theta)])),
v0y(multiply([V0,sin(Theta)]))
).

%%%%%% h0 %%%%%%
_specification(
h0(H0),
[],
Undefined,
[h0(H0)]
).

%%%%%% hx %%%%%%
_specification(
hx(Hx),
[],
Undefined,
[]
).

%%%%%% gravity %%%%%%
_specification(
gravity(G),
[],
Undefined,
[]
).

%%%%%% theta %%%%%%
_specification(
theta(Theta),
[],
Undefined,
[]
).

%%%%%% v0 %%%%%%
_specification(
v0(V0),
[],
Undefined,
Undefined
).


