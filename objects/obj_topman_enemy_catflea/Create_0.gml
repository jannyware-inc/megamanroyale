event_inherited();
//enemy Flags
isShootable = true;
ricochet = false;
hp = 1;
damageC = 3;
zone = -1;
hurt = 0;
wasHurt = 0;
invincible = false;
//position
homeY = y;
homeX = x;
spd = 1.25;
hspd = 0;
vspd = 0;
grav = .3;
sideFacing = 1;
grounded = 0;


//timers, etc
bounceVspd = -5;
waitTimerMax = 30;
waitTimer = waitTimerMax;

wall = noone;