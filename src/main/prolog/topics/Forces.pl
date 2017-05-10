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
subgoals,
friction_force(Magnitude),
[mass(Object, Mass), gravity(Object, G), miu(Object, Miu)]
).

_specification(
solution,
friction_force(Magnitude),
[mass(Object, Mass), gravity(Object, G), miu(Object, Miu)],
friction_force(multiply([Mass, G, Miu]))
).
