event_inherited();
//enemy Flags
isShootable = true;
ricochet = false;
hpMax = 3
hp = hpMax;
damageC = 2;
zone = -1;
hurt = 0;
wasHurt = 0;
invincible = false;
//position
homeY = y;
homeX = x;
swaySpd = 1.15;
spd = swaySpd;
atkSpd = 3;
hspd = 0;
vspd = 0;
grav = .3;
sideFacing = -1;
grounded = 0;
startDir = 180;
dir = startDir;
minDir = 105;
maxDir = 255;
dirDelta = 5;

//timers, etc
state = "dirUp";
poofTimerMax = 24;
poofTimer = poofTimerMax;