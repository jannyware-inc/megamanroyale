event_inherited();
/// @desc Initialize
hspd = 0;
vspd = 0;
dir = 0;
ricochet = 0;
weaponid = 2;
shootHspd = 2;
shootVspd = -2;

/// @desc Initialize
spd = 3;
frames = 180;
grav = .3;
grounded = 0;
sideMoving = -1;
dir = 90 - sideMoving * 90;
grounded = 0;

//timers, etc
state = "shoot";
ID = 0;