event_inherited();
//enemy Flags
isShootable = true;
ricochet = true;
hp = 1;
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
grav = .3;
sideFacing = 1;
grounded = 0;
attackDistance = 120;
attackY = 50;
//timers, etc
state = "sleep";
sleepTimerMax = 35;
sleepTimer = sleepTimerMax;
getupTimerMax = 10;
getupTimer = getupTimerMax;
idleTimerMax = 30;
idleTimer = idleTimerMax;
walkTimerMax = 60;
walkTimer = walkTimerMax;