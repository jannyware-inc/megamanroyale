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
grav = 0;
sideFacing = 1;
grounded = 0;

//timers, etc
atkDistance = 40;
atkYDistance = -180;
state = "wait";
atky = y-16-19-60;
attackTimerMax = noone;
attackTimer = noone;
atkVspd = -4;
retreatVspd = 1;
waitTimerMax = 20;
waitTimer = waitTimerMax;