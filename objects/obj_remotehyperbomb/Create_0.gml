event_inherited();
/// @desc Initialize
centerx = x;
centery = y;
hspd = 0;

spdSlow = 4;
spdFast = 6;
dirGen = false;
vspd = 0;
spd = 3;
frames = 80;
dir = 0;
ricochet = 0;
playedRicochet = 0;
weaponid = 2
grav = .3;
angle = 0;
lastHspd = 0;
lastVspd = 0;
grounded = 0;
bounce = .5;
wallCollide = 0;
decel = .85;
decelonbounce = .90;

sideMoving = -1; // left
dir = 90 - sideMoving * 90;
grounded = 0;

//timers, etc
state = "dirGen";



hspd = 0;
vspd = 0;
spd = 5;
damageC = 2;
frames = 35;
dir = 0;
ricochet = 0;
weaponid = 0;
ID = 0;
