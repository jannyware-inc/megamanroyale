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
iFrameTimerMax = 20;
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
fallSquatIntroTimerMax = 59;
fallSquatTimer = fallSquatIntroTimerMax;

sleepIntroTimerMax = 20;
sleepIntroTimer = sleepIntroTimerMax;

sideFacing = -1;
normalgrav = .2;
fallgrav = .4;
grav = normalgrav;

runSpd = 4;
grounded = 0;

fallSquatAtkTimerMax = 30;
fallSquatAtkTimer = fallSquatAtkTimerMax;

idleTimerMax = 180;
idleTimer = idleTimerMax;
jumpType = 0;
jumpVspd = -6.875;
jumpHspd = 3;

jumpSquatTimerMax = 20;
jumpSquatTimer = jumpSquatTimerMax;

rumblelayer1 = layer_get_id("fg");
rumblelayer2 = layer_get_id("fg_shadow");
rumblelayer3 = layer_get_id("bg");

shoot1TimerMax = 10;
shoot2TimerMax = 10;
shoot3TimerMax = 10;
shoot4TimerMax = 10;
shoot5TimerMax = 10;
shootTimer = shoot1TimerMax;

shootOffsetX = 10;
shootOffsetY = -12;

fall1TimerMax = 60/8*3-1;
fall1Timer = fall1TimerMax;

tauntTimerMax = 60/4*2;
tauntTimer = tauntTimerMax;

fallDistance = 16;

getupTimer = fall1TimerMax;
getupVspd = -4;
rumbleTimerMax = 60;
rumbleTimer = rumbleTimerMax;

//attack bounds (origin is spawn point)
leftBarrier = xstart - 170;
rightBarrier = xstart + 5;
columnX = (leftBarrier + rightBarrier) / 2

global.player.canInput = false;
player = global.player;
hpMeter = instance_create_depth(x,y,-5,obj_healthMeterBoss);
