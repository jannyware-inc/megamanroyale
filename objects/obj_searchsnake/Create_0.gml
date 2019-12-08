event_inherited();
/// @desc Initialize
hspd = 0;
shootHspd = 2;
shootVspd = -2;
vspd = 0;
spd = 3;
frames = 180;
dir = 0;
ricochet = 0;
playedRicochet = 0;
networkSent = 0;
weaponid = 2
grav = .3;
angle = 0;

grounded = 0;

sideMoving = -1; // left
dir = 90 - sideMoving * 90;
grounded = 0;

//timers, etc
state = "shoot";

//idn = global.bulletIDNum++;
centerx = x;
centery = y;