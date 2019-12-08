event_inherited();
state = "sleep";
hp = 3;
ricochet = 0;
homeY =y;
isShootable = true;
invincible = false;
isSolid = false;
zone = -1;
damageC = 3;
vspd = 0;
hspd = 0;
hurt = 0;
wasHurt = 0;

homeY = y;
homeX = x;

mirror = 1;

rightThrowOffset = 28;

attackTimerMax = 20;
attackTimer = attackTimerMax;

sleepTimerMax = 200;
sleepTimerStart = 120;
sleepTimer = sleepTimerStart;
spd = 1.5;
dir = 0;
aRad = 250;
spriteOffsetY = -26;
spriteOffsetX = -11;


stopAnimations = false;

platform = instance_nearest(x, y, obj_airman_enemy_flaotingplatform);


