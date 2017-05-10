%##################################################################

%#Time elapsed before two trains meet - trains coming towards each other given distance between them and their speeds.

_specification(
subgoals,
meeting_time1(Object1, Object2, MT1),
[d(Object1, Object2, D), s(Object1, S1), s(Object2, S2)]).

_specification(
solution,
meeting_time1(Object1, Object2, MT1),
[d(Object1, Object2, D), s(Object1, S1), s(Object2, S2)],
Solution):- _case(meeting_time1(Object1, Object2), d(D), s1(S1), s2(S2), Solution).

_case(meeting_time1(Object1, Object2), d(D), s1(S1), s2(S2), meeting_time1(Unknown)):- not _numeric_processing(enabled).
_case(meeting_time1(Object1, Object2), d(D), s1(S1), s2(S2), meeting_time1(Object1, Object2, divide(D, add(S1, S2)))):- S1+S2 \= 0.
_case(meeting_time1(Object1, Object2), d(D), s1(S1), s2(S2), meeting_time1(Object1, Object2, trains_do_not_meet)):- S1+S2 = 0.

%##################################################################

%#Time elapsed before two trains meet - trains going in the same direction given distance between them and their speeds - assuming that the faster train is behind.

_specification(
subgoals,
meeting_time2(Object1, Object2, MT2),
[d(Object1, Object2, D), s(Object1, S1), s(Object2, S2)]).

_specification(
solution,
meeting_time2(Object1, Object2, MT2),
[d(Object1, Object2, D), s(Object1, S1), s(Object2, S2)],
Solution):- _case(meeting_time2(Object1, Object2), d(D), s1(S1), s2(S2), Solution).

_case(meeting_time2(Object1, Object2), d(D), s1(S1), s2(S2), meeting_time2(Unknown)) :- not _numeric_processing(enabled).
_case(meeting_time2(Object1, Object2), d(D), s1(S1), s2(S2), meeting_time2(Object1, Object2, divide(D, sub(S1, S2)))):- S1 > S2.
_case(meeting_time2(Object1, Object2), d(D), s1(S1), s2(S2), meeting_time2(Object1, Object2, divide(D, sub(S2, S1)))):- S1 < S2.
_case(meeting_time2(Object1, Object2), d(D), s1(S1), s2(S2), meeting_time2(Object1, Object2, trains_do_not_meet)):- S1 = S2.

%##################################################################

%#Distance covered by the bird given bird flying between two trains at certain speed, trains coming towards each other initially separated by a given distance.
_specification(
subgoals,
distance_bird(Object1, Object2, Object3, DB),
[d(Object1, Object2, D), s(Object1, S1), s(Object2, S2), s(Object3, BS)]).

_specification(
solution,
distance_bird(Object1, Object2, Object3, DB),
[d(Object1, Object2, D), s(Object1, S1), s(Object2, S2), s(Object3, BS)],
distance_bird(Object1, Object2, Object3, multiply([BS, divide(D, add(S1, S2))]))).

%##################################################################

%#trains crossing each other - are they on a collision path?

_specification(
subgoals,
will_trains_collide(Object1, Object2, WTC),
[d(Object1, D1), d(Object2, D2), s(Object1, S1), s(Object2, S2)]).

_specification(
solution,
will_trains_collide(Object1, Object2, WTC),
[d(Object1, D1), d(Object2, D2), s(Object1, S1), s(Object2, S2)],
Solution):- _case(wtc(Object1, Object2), d1(D1), d2(D2), s1(S1), s2(S2), Solution).

_case(wtc(Object1, Object2), d1(D1), d2(D2), s1(S1), s2(S2), will_trains_collide(Unknown)):- not _numeric_processing(enabled).
_case(wtc(Object1, Object2), d1(D1), d2(D2), s1(S1), s2(S2), will_trains_collide(Object1, Object2, yes)):- D1/S1 = D2/S2.
_case(wtc(Object1, Object2), d1(D1), d2(D2), s1(S1), s2(S2), will_trains_collide(Object1, Object2, no)):- D1/S1 \= D2/S2.

%##################################################################

%#Time taken to go downstream - given time taken to go upstream, speed of river current, speed of boat.

_specification(
subgoals,
downstream_time(Object1, Object2, DT),
[s(Object1, BS), s(Object2, RS), t(Object1, UT)]).

_specification(
solution,
downstream_time(Object1, Object2, DT),
[s(Object1, BS), s(Object2, RS), t(Object1, UT)],
Solution):- _case(downstream_time(Object1, Object2), bs(BS), rs(RS), ut(UT), Solution).

_case(downstream_time(Object1, Object2), bs(BS), rs(RS), ut(UT), downstream_time(Unknown)):- not _numeric_processing(enabled).
_case(downstream_time(Object1, Object2), bs(BS), rs(RS), ut(UT), downstream_time(Object1, Object2, divide(multiply([sub(BS, RS), UT]), add(RS, BS)))):- BS > RS.
_case(downstream_time(Object1, Object2), bs(BS), rs(RS), ut(UT), downstream_time(Object1, Object2, incorrect_data)):- BS < RS.

%##################################################################

%#Time taken to go upstream - given time taken to go downstream, speed of river current, speed of boat.

_specification(
subgoals,
upstream_time(Object1, Object2, UT),
[s(Object1, BS), s(Object2, RS), t(Object1, DT)]).

_specification(
solution,
upstream_time(Object1, Object2, UT),
[s(Object1, BS), s(Object2, RS), t(Object1, DT)],
Solution):- _case(upstream_time(Object1, Object2), bs(BS), rs(RS), dt(DT), Solution).

_case(upstream_time(Object1, Object2), bs(BS), rs(RS), dt(DT), upstream_time(Unknown)):- not _numeric_processing(enabled).
_case(upstream_time(Object1, Object2), bs(BS), rs(RS), dt(DT), upstream_time(Object1, Object2, divide(multiply([add(BS, RS), UT]), sub(BS, RS)))):- BS > RS.
_case(upstream_time(Object1, Object2), bs(BS), rs(RS), dt(DT), upstream_time(Object1, Object2, cannot_go_upstream)):- BS < RS.

%##################################################################

%#Time taken to go downstream - given distance, speed of river current, speed of boat.

_specification(
subgoals,
downstream_time1(Object1, Object2, DT1),
[d(Object1, D), s(Object1, BS), s(Object2, RS)]).

_specification(
solution,
downstream_time1(Object1, Object2, DT1),
[d(Object1, D), s(Object1, BS), s(Object2, RS)],
downstream_time1(Object1, Object2, divide(D, add(RS,BS)))).

%##################################################################

%#Time taken to go upstream - given distance, speed of river current, speed of boat.

_specification(
subgoals,
upstream_time1(Object1, Object2, UT1),
[d(Object1, D), s(Object1, BS), s(Object2, RS)]).

_specification(
solution,
upstream_time1(Object1, Object2, UT1),
[d(Object1, D), s(Object1, BS), s(Object2, RS)],
Solution):- _case(upstream_time1(Object1, Object2), d(D), rs(RS), bs(BS), Solution).

_case(upstream_time1(Object1, Object2), d(D), rs(RS), bs(BS), upstream_time1(Unknown)):- not _numeric_processing(enabled).
_case(upstream_time1(Object1, Object2), d(D), rs(RS), bs(BS), upstream_time1(Object1, Object2, divide(D, sub(BS, RS)))):- BS > RS.
_case(upstream_time1(Object1, Object2), d(D), rs(RS), bs(BS), upstream_time1(Object1, Object2, cannot_go_upstream)):- BS =< RS.