event_inherited();
state = "fall";
returnstate = "";
wasHurt = 0;
hpMax = 28;
hp = 0;
zone = -1;
hurt = 0;
canDie = 0;
isShootable = true;
isSolid = false;
wallCollide = false;
damageC = 6;


vspd = 0;
hspd = 0;
ricochet = 1;
iFrameTimerMax = 30;
iFrameTimer = 0;
invincible = false;
blinking = false;
movingFloor = instance_nearest(x,y,obj_metalman_movingfloor);
if(instance_exists(movingFloor)){
	movingFloor.sideFacing = -1;
}
sideMoving = -1;
jumpDistance = 100;
hpTimerMax = 3;
hpTimer = hpTimerMax;
homeY = y;
homeX = x;
attacked = 0;
attackedColumn = 0;
turnx = xstart;

sleepTimerMax = 120;
sleepTimer = sleepTimerMax;

fallSquatTimerMax = 5;
fallSquatIntroTimerMax = 20;
fallSquatTimer = fallSquatIntroTimerMax;

sleepIntroTimerMax = 40;
sleepIntroTimer = sleepIntroTimerMax;

jumpOverHspd = 3;
jumpOverVspd = -9;
jumpOverThrowTimerMax = 30;
jumpOverThrowTimer = jumpOverThrowTimerMax;
throwStopVspd = true;
sideFacing = -1;
grav = .35;

runSpd = 4;
grounded = 0;

fallSquatAtkTimerMax = 30;
fallSquatAtkTimer = fallSquatAtkTimerMax;

idleTimerMax = 180;
idleTimer = idleTimerMax;
jumpType = 0;
jumpType0Vspd = -4;
jumpType1Vspd = -6.2;
jumpType2Vspd = -8;

throwTimerMax = 5;
throwTimer = throwTimerMax;
windupTimerMax = 5;
windupTimer = windupTimerMax;
windup2TimerMax = 5;
windup2Timer = windup2TimerMax;

jumpVspd = -3;

//attack bounds (origin is spawn point)
leftBarrier = xstart - 170;
rightBarrier = xstart + 5;
columnX = (leftBarrier + rightBarrier) / 2

conveyorSwitchTimerMax = 600;
conveyorSwitchTimer = conveyorSwitchTimerMax;
whiteBgEnabled = false;
whitebg = layer_get_id("Background_white");

global.player.canInput = false;
player = global.player;
hpMeter = instance_create_depth(x,y,-5,obj_healthMeterBoss);
