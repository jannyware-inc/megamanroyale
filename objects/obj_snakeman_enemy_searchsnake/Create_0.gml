event_inherited();
//enemy Flags
isShootable = false;
ricochet = false;
hp = 1;
damageC = 3;
zone = -1;
hurt = 0;
invincible = false;

//position
homeY = y;
homeX = x;
spd = 2;
hspd = 0;
vspd = 0;
grav = .3;
sideFacing = -1;
onGround = 0;

sideMoving = -1; // left
dir = 90 - sideMoving * 90;
grounded = 0;

//timers, etc
state = "fall";
