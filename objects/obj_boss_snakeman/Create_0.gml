event_inherited();
state = "fall";
wasHurt = 0;
hpMax = 28;
hp = 0;
zone = -1;
hurt = 0;
canDie = 0;
isShootable = true;
isSolid = false;
wallCollide = false;
damageC = 3;
vspd = 0;
hspd = 0;
ricochet = 1;
snakesMax = 3;
snakes = snakesMax;
invincible = false;
iFrameTimerMax = 15;
iFrameTimer = 0;
blinking = false;

sideMoving = -1;

bigHopVspd = -5.2;
smallHopVspd = -3.3;
columnHopVspd = -3;
attackLogic = 0;
attackState = "";
returnDistance = 80;

blowTimerMax = 120;
blowTimer = blowTimerMax;

shootTimerMax = 30;
shootTimer = shootTimerMax;

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

sleepIntroTimerMax = 20;
sleepIntroTimer = sleepIntroTimerMax;


jumpIndex = 0;
sideFacing = -1;
runTimerMax = 25;
runTimer = runTimerMax;

hopHspd = 1.4;
//hopVspd = -3.75;
grav = .25;
mirror = 1;

grounded = 0;

fallSquatAtkTimerMax = 30;
fallSquatAtkTimer = fallSquatAtkTimerMax;

attackTimerMax = 20;
attackTimer = attackTimerMax;
spd = 1.5;
dir = 0;
aRad = 250;

shootTimerMax = 15;
shootTimer = 0;
shooting = false;

//attack bounds (origin is spawn point)
leftBarrier = xstart - 172;
rightBarrier = xstart + 5;
columnX = (leftBarrier + rightBarrier) / 2
jumpOnRun = false;
attackVspd = -6;

shootOffsetX = -23;
shootOffsetY = -19;

global.player.canInput = false;


stopAnimations = false;

player = instance_nearest(x, y, obj_player);
hpMeter = instance_create_depth(x,y,-5,obj_healthMeterBoss);
