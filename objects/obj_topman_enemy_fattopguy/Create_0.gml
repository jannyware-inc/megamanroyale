event_inherited();
//enemy Flags
isShootable = true;
ricochet = false;
hp = 6;
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
grav = .3;
sideFacing = -1;
grounded = 0;

//timers, etc
state = "waitInView";
chargeTimerMax = 60;
chargeTimer=chargeTimerMax;
attackTimerMax = 15;
attackTimer=attackTimerMax;
