_members([], Ys).
_members([X | T], Ys) :- _member(X, Ys), _members(T, Ys).

_member(X, [X|_]).
_member(X, [_|Tail]) :- _member(X, Tail).

_append([],X,X).
_append([X|Y],Z,[X|W]) :- _append(Y,Z,W).
