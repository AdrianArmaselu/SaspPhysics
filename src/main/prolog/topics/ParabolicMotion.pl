
%%%%%% Total Time before touching ground%%%%%%

%txmax = -v0y - sqrt(v0y^2) / -g
_specification(subgoals, txmax(Object,Txmax), [h0(Object,H0), hx(Object,Hx), gravity(Object,G), v0y(Object,V0y)]).
_specification(
solution,
txmax(Object, Txmax),
[h0(Object, H0), hx(Object,Hx), gravity(Object, G), v0y(Object, V0y)],
txmax(Object, divide(sub(neg(V0y), sqrt(sub(pow(V0y, 2), multiply([2, G, sub(H0, Hx)])))), neg(G)))
).

%txmax
_specification(subgoals, txmax(Object, Txmax),[x(Object, X), vx(Object, Vx)]).
_specification(solution, txmax(Object, Txmax),[x(Object, X), vx(Object, Vx)], txmax(Object, divide(X, Vx))).

%%%%%% Max Height %%%%%%
% h = -gt/2 + h0
% solve([ymax(X)], [gravity(G), thmax(Thmax), h0(H0)]).

_specification(subgoals, ymax(Object, Magnitude), [gravity(Object, G), thmax(Object, Thmax), h0(Object, H0)]).
_specification(
solution,
ymax(Object, YMax),
[gravity(Object, G), thmax(Object, Thmax), h0(Object, H0)],
ymax(Object, add(neg(divide(multiply([G,Thmax]), 2)), H0))
).

%%%%%% thmax: Maximum Height Time %%%%%%
% t = V0y / g
_specification(subgoals, thmax(Object, Thmax), [v0y(Object, V0y), gravity(Object, G)]).
_specification(
solution,
thmax(Object, Thmax),
[v0y(Object, V0y), gravity(Object, G)],
thmax(Object, divide(V0y, G))
).

%%%%%% V0Y %%%%%%
_specification(
subgoals,
v0y(Object, V0y),
[v0(Object, V0), theta(Object, Theta)]
).

_specification(
solution,
v0y(Object, V0y),
[v0(Object, V0), theta(Object, Theta)],
v0y(Object, multiply([V0,sin(Theta)]))
).

%%%%%%% dotheymeet %%%%%

_specification(
subgoals,
theymeet(Object1, Object2, Time1),
[time(Object1, T1), time(Object2, T2)],
answer
).