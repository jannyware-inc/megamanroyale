event_inherited();
//enemy Flags
isShootable = true;
ricochet = false;
hp = 1;
damageC = 2;
zone = -1;
hurt = 0;
invincible = false;
//position
homeY = y;
homeX = x;
spd = 1;
hspd = 0;
vspd = 0;
sideFacing = -1;

//timers, etc
atkDist = 5;
state = "getDir";
attackTimerMax = 20;
attackTimer = attackTimerMax;