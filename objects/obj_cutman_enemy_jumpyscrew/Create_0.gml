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
spd = 1.6;
hspd = 0;
vspd = 0;
grav = .1;
sideFacing = -1;
grounded = 0;

//timers, etc
state = "idle";
idleTimerMax = 60;
idleTimer=irandom(50)+10;
jumpHspd = 0;
jumpVspd = -3;