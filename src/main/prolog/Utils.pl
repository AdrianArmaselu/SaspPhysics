_debug([]) :- nl. % it does not always do the println for some reason
_debug([Arg|Arguments]):-
	write(Arg), write(' '),
	_debug(Arguments).



