event_inherited();
//enemy Flags
isShootable = true;
ricochet = false;
hp = 8;
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
grav = .3;
sideFacing = -1;
grounded = 0;
attackDistance = 120;
attackY = 100;
//timers, etc
state = "idle";
atkDist = 200;
idleTimerMax = 80;
idleTimer = idleTimerMax;
openTimerMax = 40;
openTimer = openTimerMax;
attackTimerMax = 30;
attackTimer = attackTimerMax;
rocketsMax = 2;
rockets = rocketsMax;

shootOffsetX = 3;
shootOffsetY = -16;

reflector = instance_create_depth(x-25,y-30,depth-1,obj_enemy_reflector);
with(reflector){
	image_xscale = 50;
	image_yscale = 30;
}