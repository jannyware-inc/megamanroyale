event_inherited();
/// @desc Initialize
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
networkSent = 0;
weaponid = 5;
grav = .3;
angle = 0;
lastHspd = 0;
lastVspd = 0;
grounded = 0;
bounce = .5;
wallCollide = 0;
decel = .85;
decelonbounce = .90;
misfireChance = 100;

sideMoving = -1; // left
dir = 90 - sideMoving * 90;
grounded = 0;

//timers, etc
state = "dirGen";

//idn = global.bulletIDNum++;

centerx = x;
centery = y;