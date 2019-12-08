event_inherited();
//enemy Flags
isShootable = true;
ricochet = false;
hp = 3;
damageC = 6;
zone = -1;
hurt = 0;
wasHurt = 0;
invincible = false;
//position
homeY = y;
homeX = x;
spd = 3;
hspd = 0;
vspd = 0;
grav = .3;
sideFacing = -1;
grounded = 0;

//timers, etc
state = "sit";
idleTimerMax = 60;
idleTimer=idleTimerMax;
jumpHspd = 0;
jumpVspd = -5;
sitTimerMax = 60;
sitTimer = sitTimerMax;
atkDistance = 240;
nextState = "idle";