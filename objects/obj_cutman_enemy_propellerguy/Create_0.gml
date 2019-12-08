event_inherited();
//enemy Flags
isShootable = true;
ricochet = false;
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
atkDistance = 50;
state = "hover";
atkx = noone;
atky = noone;
attackTimerMax = noone;
attackTimer = noone;
sty = noone;
stx = noone;
atkvspd = noone;
atkhspd = 1.8;