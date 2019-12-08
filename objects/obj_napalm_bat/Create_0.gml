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
spd = .75;
hspd = 0;
vspd = 0;
grav = 0;
sideFacing = -1;
grounded = 0;

//timers, etc
state = "sleep";
wakeupTimerMax = 60/8*2;
wakeupTimer = wakeupTimerMax;
sleepTimerMax = 40+irandom(40);
sleepTimer = sleepTimerMax;
sitTimerMax = 60;
sitTimer = sitTimerMax;
atkDistance = 240;
attackTimerMax = 120;
attackTimer = attackTimerMax;