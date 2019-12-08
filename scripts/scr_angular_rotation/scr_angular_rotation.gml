/// @desc angle_rotate(angle, target, speed)
/// @arg angle
/// @arg target
/// @arg speed
var diff;
// 180 is to be replaced by "pi" for radians
diff = scr_cycle(argument1 - argument0, -180, 180);
// clamp rotations by speed:
if (diff < -argument2) return argument0 - argument2;
if (diff > argument2) return argument0 + argument2;
// if difference within speed, rotation's done:
return argument1;