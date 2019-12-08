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
damageC = 6;
vspd = 0;
hspd = 0;
ricochet = 1;
iFrameTimerMax = 10;
iFrameTimer = 0;
invincible = false;
blinking = false;

sideMoving = -1;

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

grav = .25;

runSpd = 4;
grounded = 0;

fallSquatAtkTimerMax = 30;
fallSquatAtkTimer = fallSquatAtkTimerMax;

attackTimerMax = 20;
attackTimer = attackTimerMax;
spd = 1.5;
dir = 0;
aRad = 250;

throw1TimerMax = 5;
throw1Timer = throw1TimerMax;
throw2TimerMax = 5;
throw2Timer = throw2TimerMax;
throw3TimerMax = 20;
throw3Timer = throw3TimerMax;
throw4TimerMax = 15;
throw4Timer = throw4TimerMax;
#macro THROW5TIMERMAX 30+irandom(10);
throw5Timer = THROW5TIMERMAX;
dabTimerMax = 10;
dabTimer = dabTimerMax;
deployTopsTimerMax = 20;
deployTopsTimer = deployTopsTimerMax;


#macro SPINTIMERMAX 50+irandom(20);
spinTimer = SPINTIMERMAX;

top1 = noone;
top2 = noone;
top3 = noone;

throw2TopX = 1;
throw2TopY = -20;

throw3TopX = -3;
throw3TopY = -24;

topMoveFramesStart = 10;
topMoveFramesDelta = 9;

//attack bounds (origin is spawn point)
leftBarrier = xstart - 170;
rightBarrier = xstart + 5;
columnX = (leftBarrier + rightBarrier) / 2



global.player.canInput = false;
player = global.player;
hpMeter = instance_create_depth(x,y,-5,obj_healthMeterBoss);
