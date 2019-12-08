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
spd = 2.5;
moveSpd = 0; //gets set in step
hspd = 0;
vspd = 0;
grav = 0;
sideFacing = -1;
grounded = 0;
attackDistance = 120;
attackY = 250;
//timers, etc
state = "sleep";
verticalTimerMax = 45;
verticalTimer = verticalTimerMax;
moveTimerMax = 60;
moveTimer = moveTimerMax;

shootTimerMax = 100;
shootTimer = shootTimerMax;