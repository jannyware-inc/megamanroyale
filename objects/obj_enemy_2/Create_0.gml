event_inherited();
state = "sleep";
zone = -1;
isShootable = true;
isSolid = false;
damageC = 3;
hp = 2;
ricochet = 1;
invincible = false;
hurt = 0;
homeY = y;
homeX = x;
hurt = 0;
wasHurt = 0;
restY = homeY;
retreatSpd = 1.5;
sleepRandom = 80;
sleepBase = 40;

sleepTimerMax = 120;
sleepTimer = sleepBase + random(sleepRandom);
wakeUpTimerMax = 30;
wakeUpTimer = wakeUpTimerMax;
spd = .5;
dir = 0;
aRad = 150;
dRad = 180;
swoopRad = 70;