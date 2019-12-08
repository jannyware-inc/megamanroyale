event_inherited();
state = "paw";

homeY = y;
isShootable = true;
isSolid = true;
zone = -1;
ricochet = 0;
invincible = false;
hurt = 0;
damageC = 5;
tailIndex = 0;
tailSleepTimerMax = 60;
tailSleepTimer = tailSleepTimerMax;
tailWagTimerMax = 20;
tailWagTimer = tailWagTimerMax;
tailState = "sleep";
tailFramesMax = 40;
tailFrames = tailFramesMax;
wasHurt = 0;
fireballRandom = 3;
fireballTimerMax = 2;
fireballTimer = 0;
fireballs = 4 + random(fireballRandom);
sleepTimerMax = 35;
sleepTimer = sleepTimerMax;
pawTimerMax = 45;
pawTimer = pawTimerMax;

fireballOffsetY = 35;
fireballOffsetX = 10;

spd = 1;
dir = 0;
aRad = 130;
dRad = 180;
hp = 12;

stopAnimations = false;

player = instance_nearest(x, y, obj_player);
wall1 = instance_create_depth(x+16,y-32,0,obj_wall);
with(wall1){
	image_xscale = 4;
	image_yscale = 6;
	visible = 0;
}