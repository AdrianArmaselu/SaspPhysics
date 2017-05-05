_debug([]) :- nl. % it does not always do the println for some reason
_debug([Arg|Arguments]):-
	write(Arg), write(' '), nl,
	_debug(Arguments).


_debugnl([]) :- nl. % it does not always do the println for some reason
_debugnl([Arg|Arguments]):-
	write(Arg), write(' '), nl,
	_debugnl(Arguments).


