event_inherited();
//enemy Flags
isShootable = true;
damageTable = noone;
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
spd = 1.4;
hspd = 0;
vspd = 0;
grav = 0;
sideFacing = 1;
grounded = 0;

//timers, etc
atkDistance = 250;
state = "idle";
idleTimerMax = 120;
startIdleTimer = 30+irandom(90);
idleTimer = startIdleTimer;
openTimerMax = 60/12;
openTimer = openTimerMax;
shotsMax = 2;
shots = shotsMax;
attackTimerMax = 30;
attackTimer = attackTimerMax;
image_yscale=-1;