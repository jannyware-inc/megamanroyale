event_inherited();
hspd = 0;
vspd = 0;
spd = 6.5;

ricochet = false;
zone = -1;
isShootable = true;
invincible = false;
isSolid = false;
damageC = 2;
hp = 1;
broken = 0;
dropDistance = 80;
hasHive = true;

sideMoving = 1;
sideFacing = 1;

dir = 0;
aRad = 100;
aliveFrames = 60;

sinTimer = 0;

RTDTimerMax = 50;
RTDTimer = RTDTimerMax;
state = "fly";
hive = instance_create_depth(x,y+sprite_height,depth,obj_hardman_beehive);
with(hive){
	fall = false;
}