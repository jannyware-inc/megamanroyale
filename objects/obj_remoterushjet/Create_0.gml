event_inherited();
//enemy Flags
isShootable = false;
ricochet = false;
hp = 1;
damageC = 3;
zone = -1;
hurt = 0;
dir = 0;

//position
homeY = y;
homeX = x;
spd = 0;
hspd = 0;
vspd = 0;
grav = .3;
sideFacing = -1;
grounded = 0;
aliveTimer = 230;

//timers, etc
state = "deploy";
deployTimer = 30;
maxSpd = 3.5;
accelSpd = .1;
aliveTimer = 180;
blinkFrames = 30;

laddertop = instance_create_depth(x,y,depth-100,obj_laddertop);
with(laddertop){
	canDescend = false;
}