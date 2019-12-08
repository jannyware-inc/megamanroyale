event_inherited();
//enemy Flags
isShootable = true;
ricochet = false;
hp = 6;
damageC = 8;
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
grav = .3;
sideFacing = -1;
grounded = 0;

//timers, etc
state = "idle";
idleTimerMax = 60;
idleTimer=idleTimerMax;
jumpHspd = 0;
jumpVspd = -5;
openTimerMax = 10;
openTimer = openTimerMax;