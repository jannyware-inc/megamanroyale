event_inherited();
//enemy Flags
isShootable = true;
ricochet = false;
hp = 4;
damageC = 3;
zone = -1;
hurt = 0;
wasHurt = 0;
invincible = false;
//position
homeY = y;
homeX = x;
spd = 2;
hspd = 0;
vspd = 0;
grav = .3;
sideFacing = 1;
grounded = 0;

//timers, etc
state = "wait";
gearboi = noone;
spawnDistance = 180;
gearboiGrav = .3;
gearboiJumpVspd = -3.5;
gearboiJumpsMax = 2;
gearboiJumps = gearboiJumpsMax;
spdWGearboi = 1.2;
spdWOGearboi = .5;
genDir = false;