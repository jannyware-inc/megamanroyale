event_inherited();
//enemy Flags
isShootable = false;
ricochet = false;
hp = 3;
damageC = 5;
zone = -1;
hurt = 0;
wasHurt = 0;
invincible = false;
//position
homeY = y;
homeX = x;
spd = 5;
hspd = 0;
vspd = 0;
grav = .3;
sideFacing = -1;
grounded = 0;
dirGen = false;

//timers, etc
aliveframes = 120;
state = "fall";