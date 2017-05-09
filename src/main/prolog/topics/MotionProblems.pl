%distance
_specification(
subgoals,
d(Object, D),
[t(Object, T), s(Object, S)]
).

_specification(
solution,
d(Object, D),
[t(Object, T), s(Object, S)],
d(Object, multiply(S, T))).

% speed
_specification(
subgoals,
s(Object, S),
[t(Object, T), d(Object, D)]
).

_specification(
solution,
s(Object, S),
[t(Object, T), d(Object, D)],
Solution):- _case(s(Object), t(T), d(D), Solution).

_case(s(Object), t(T), d(D), s(Unknown)) :- not _numeric_answer(enabled).
_case(s(Object), t(T), d(D), s(Object, divide(D, T))):- T \= 0.
_case(s(Object), t(T), d(D), s(Object, infinite)):- T = 0.

%
_specification(
subgoals,
meeting_time2(Object1, Object2, MT2),
[d(Object1, Object2, D), s(Object1, S1), s(Object2, S2)]
).

_specification(
solution,
meeting_time2(Object1, Object2, MT2),
[d(Object1, Object2, D), s(Object1, S1), s(Object2, S2)],
Solution):- _case(meeting_time2(Object1, Object2), d(D), s1(S1), s2(S2), Solution).

_case(meeting_time2(Object1, Object2), d(D), s1(S1), s2(S2), meeting_time2(Unknown)) :- not _numeric_answer(enabled).
_case(meeting_time2(Object1, Object2), d(D), s1(S1), s2(S2), meeting_time2(Object1, Object2, divide(D, sub(S1, S2)))):- S1 > S2.
_case(meeting_time2(Object1, Object2), d(D), s1(S1), s2(S2), meeting_time2(Object1, Object2, divide(D, sub(S2, S1)))):- S1 < S2.
_case(meeting_time2(Object1, Object2), d(D), s1(S1), s2(S2), meeting_time2(Object1, Object2, trains_do_not_meet)):- S1 = S2.