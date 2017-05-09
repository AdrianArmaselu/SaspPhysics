_specification(
subgoals,
force(Object, Magnitude),
[mass(Object, Mass), acceleration(Object, Acceleration)]
).

_specification(
solution,
force(Object, Magnitude),
[mass(Object, Mass), acceleration(Object, Acceleration)],
force(Object, multiply([Mass, Acceleration]))
).

_specification(
friction_force(Magnitude),
[mass(Mass), gravity(G), miu(Miu)],
Formula,
friction_force(multiply([Mass, G, Miu]))
) :- Formula =  friction_force = Miu * G * Mass.
