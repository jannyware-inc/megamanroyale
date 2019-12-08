event_inherited();
//enemy Flags
isShootable = true;
ricochet = true;
hp = 1;
damageC = 6;
zone = -1;
hurt = 0;
wasHurt = 0;
invincible = false;
//position
homeY = y;
homeX = x;
hspd = 0;
vspd = 0;
riseVspd = -.5;
grav = .3;
sideFacing = 1;
grounded = 0;
attackDistance = 50;

//timers, etc
state = "wait";
waitfloorTimerMax = 60;
waitfloorTimer = waitfloorTimerMax;

wall = instance_create_depth(x-16,y-15,-600,obj_wall);
with(wall){
	visible = false;
	image_yscale = .3;
	image_xscale = 2;
}