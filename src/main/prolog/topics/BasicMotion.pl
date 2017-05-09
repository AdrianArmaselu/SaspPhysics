%#Calculating time given speed and distance.

_specification(
subgoals,
t(Object, T),
[s(Object, S), d(Object, D)]).

_specification(
solution,
t(Object, T),
[s(Object, S), d(Object, D)],
Solution):- _case(t(Object), s(S), d(D), Solution).

_case(t(Object), s(S), d(D), t(Unknown)):- not _numeric_answer(enabled).
_case(t(Object), s(S), d(D), t(Object, divide(D, S))):- S \= 0.
_case(t(Object), s(S), d(D), t(Object, infinite)):- S = 0.

%##################################################################

%#Calculating speed given time and distance.

_specification(
subgoals,
s(Object, S),
[t(Object, T), d(Object, D)]).

_specification(
solution,
s(Object, S),
[t(Object, T), d(Object, D)],
Solution):- _case(s(Object), t(T), d(D), Solution).

_case(s(Object), t(T), d(D), s(Unknown)):- not _numeric_answer(enabled).
_case(s(Object), t(T), d(D), s(Object, divide(D, T))):- T \= 0.
_case(s(Object), t(T), d(D), s(Object, infinite)):- T = 0.

%##################################################################

%#Calculating distance given speed and time.

_specification(
subgoals,
d(Object, D),
[t(Object, T), s(Object, S)]).

_specification(
solution,
d(Object, D),
[t(Object, T), s(Object, S)],
d(Object, multiply(S, T))).