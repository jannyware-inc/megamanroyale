event_inherited();
//enemy Flags
isShootable = false;
ricochet = false;
hp = 1;
damageC = 3;
zone = -1;
hurt = 0;
dir = 0;

//position
homeY = y;
homeX = x;
spd = 2;
hspd = 0;
vspd = 0;
grav = .3;
sideFacing = -1;
grounded = 0;
aliveTimer = 230;

//timers, etc
state = "move";
swayTimerMax = 30;
swayTimer = swayTimerMax;
swayAngle = 70;

collider = instance_create_depth(x,y,depth-100,obj_crashman_platformcollider);