/// @desc cycle(value, min, max)
/// @arg value
/// @arg min
/// @arg max
var result, delta;
delta = (argument2 - argument1);
result = (argument0 - argument1) mod delta;
if (result < 0) result += delta;
return result + argument1;