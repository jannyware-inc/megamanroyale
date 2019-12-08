event_inherited();
//enemy Flags
isShootable = true;
ricochet = false;
hp = 3;
damageC = 3;
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
grav = .35;
sideFacing = -1;
grounded = 0;

//timers, etc
state = "idle";
idleTimerMax = 60;
idleTimer=idleTimerMax;
riseTimerMax = 80;
riseTimer = riseTimerMax;
jumpHspd = 2;
maxJumpHspd = 3;
riseVspd = -1.5;
openTimerMax = 10;
openTimer = openTimerMax;