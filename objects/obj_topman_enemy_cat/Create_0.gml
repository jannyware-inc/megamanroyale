event_inherited();
//enemy Flags
isShootable = true;
ricochet = false;
hp = 10;
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


//timers, etc
ballOffsetX = 26;
ballOffsetY = -12;
fleaOffsetX = -1;
fleaOffsetY = -26;
attack2TimerMax = 5;
attack2Timer = attack2TimerMax;
ballVspd = -4;
ballsMax = 2;
balls = ballsMax;
ballTimerMax = 45;

fleasMax = 3;
fleas = fleasMax;
fleaVspd = -3;
fleaHspd = 8;
fleaFramesMax = 5;
fleaFrames = 0;

ballTimer = ballTimerMax;
state = "wait";
waitTimerMax = 20;
waitTimer = waitTimerMax;
sleepTimerMax = 60;
sleepTimer = sleepTimerMax;
getupTimerMax = 10;
getupTimer = getupTimerMax;
idleTimerMax = 30;
idleTimer = idleTimerMax;
walkTimerMax = 60;
walkTimer = walkTimerMax;

wall = instance_create_depth(x-sprite_width/2+5,y-sprite_height,depth,obj_wall)
with(wall){
	visible = false;
	image_xscale = (other.sprite_width-3)/16;
	image_yscale = other.sprite_height/16;
}