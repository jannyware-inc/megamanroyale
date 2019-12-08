event_inherited();
//enemy Flags
isShootable = true;
ricochet = true;
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
grav = .3;
sideFacing = -1;
grounded = 0;
attackDistance = 240;
attackY = 50;
//timers, etc
state = "sleep";
sleepTimerMax = 35;
sleepTimer = sleepTimerMax;
wakeupTimerMax = 60/8*3; //second frame will be played twice
wakeupTimer = wakeupTimerMax;
idleTimerMax = 50;
idleTimer = idleTimerMax;
walkTimerMax = 60;
walkTimer = walkTimerMax;
shootTimerMax = 60/8*4;
shootTimer = shootTimerMax;
turnTimerMax = 60/8*4;
turnTimer = turnTimerMax;