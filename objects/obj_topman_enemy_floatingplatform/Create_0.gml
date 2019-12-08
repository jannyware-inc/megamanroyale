event_inherited();
//enemy Flags
isShootable = false;
ricochet = false;
hp = 1;
damageC = 3;
zone = -1;
hurt = 0;

//position
homeY = y;
homeX = x;
riseSpd = -1;
swaySpd = .5;
hspd = 0;
vspd = 0;
grav = .3;
sideFacing = -1;
grounded = 0;
aliveTimer = 300;

//timers, etc
state = "rise";
swayTimerMax = 30;
swayTimer = swayTimerMax;
swayAngle = 70;
_pCollide = false;