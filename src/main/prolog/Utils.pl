_debug([]) :- nl.
_debug([Arg|Arguments]):-
	write(Arg), write(' '),
	_debug(Arguments).

