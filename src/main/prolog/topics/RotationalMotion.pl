
%%%%% angular_velocity - angular velocity %%%%%

% based on angular displacement theta
_specification(
subgoals,
angular_velocity(Object, Omega),
[theta(Object, Theta), time(Object, Time)]
).

_specification(
solution,
angular_velocity(Object, Omega),
[theta(Object, Theta), time(Object, Time)],
angular_velocity(Object, divide(Theta / Time))
).

% based on translational speed v
_specification(
subgoals,
angular_velocity(Object, Omega),
[v(Object, V), radius(Object, R)]
).

_specification(
solution,
angular_velocity(Object, Omega),
[v(Object, V), radius(Object, R)],
angular_velocity(Object, divide(V / R))
).

% based on frequency

_specification(
subgoals,
angular_velocity(Object, Omega),
[pi(Pi), frequency(Object, Frequency)]
).

_specification(
solution,
angular_velocity(Object, Omega),
[pi(Pi), frequency(Object, Frequency)],
angular_velocity(Object, multiply([2, Pi, Frequency]))
).

% based on angular acceleration, time, and initial angular velocity
_specification(
subgoals,
angular_velocity(Object, Omega),
[]
)

%%%%% angular acceleration %%%%%

% based on angular velocity
_specification(
subgoals,
angular_acceleration(Object, Alpha),
[angular_velocity(Object, Omega), time(Object, Time)]
).

_specification(
solution,
angular_acceleration(Object, Alpha),
[angular_velocity(Object, Omega), time(Object, Time)],
angular_acceleration(Object, divide(Omega, Time))
).

%%%%% translational acceleration %%%%%
_specification(
subgoals,
translational_acceleration(Object, Acceleration),
[angular_acceleration(Object, Alpha), radius(Object, Radius)]
).

_specification(
solution,
translational_acceleration(Object, Acceleration),
[angular_acceleration(Object, Alpha), radius(Object, Radius)],
translational_acceleration(Object, multiply([Radius, Alpha]))
).

%%%%% radial acceleration %%%%%

% based on translational speed
_specification(
subgoals,
radial_acceleration(Object, Acceleration),
[translational_speed(Object, V), radius(Object, Radius)]
).

_specification(
subgoals,
radial_acceleration(Object, Acceleration),
[translational_speed(Object, V), radius(Object, Radius)],
radial_acceleration(Object, divide(pow(V,2), Radius))
).

% based on angular velocity
_specification(
subgoals,
radial_acceleration(Object, Acceleration),
[angular_velocity(Object, Omega), radius(Object, Radius)]
).

_specification(
subgoals,
radial_acceleration(Object, Acceleration),
[angular_velocity(Object, Omega), radius(Object, Radius)],
radial_acceleration(Object, multiply([Omega, Omega, Radius]))
).