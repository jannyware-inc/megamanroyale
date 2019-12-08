event_inherited();
//enemy Flags
isShootable = true;
ricochet = false;
hp = 20;
damageC = 6;
zone = -1;
hurt = 0;
wasHurt = 0;
invincible = false;
//position
homeY = y;
homeX = x;
spd = 1;
hspd = 0;
vspd = 0;
grav = .2;
sideFacing = -1;
grounded = 0;

//timers, etc
state = "idle";
idleTimerMax = 60;
idleTimer=idleTimerMax;
jumpHspd = 0;
bigJumpVspd = -4;
smallJumpVspd = -3;