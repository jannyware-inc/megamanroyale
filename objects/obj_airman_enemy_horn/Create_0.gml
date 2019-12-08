event_inherited();
hspd = 0;
vspd = 0;

zone = -1;
isShootable = true;
ricochet = true;
invincible = false;

isSolid = false;
damageC = 2;
hp = 3;

state = "sleep";
sleepTimerMax = 90;
outSleepTimerMax = 20;
sleepTimer = 0;

riseDist = 15;
currentRise = 0;
riseVspd = 1;//was .25
fallVspd = 1;

dir = 0;
//aRad = 100;
//aliveFrames = 60;
player = instance_nearest(x, y, obj_player);