event_inherited();
dmg_airshooter = 3;
dmg_rollingcutter = 3;
dmg_metalblade = 1;
dmg_hyperbomb = 1;
dmg_megabuster = 2;
healthprimary = $0028D8;
healthsecondary = $FFFFFF;

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
iFrameTimerMax = 25;
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

runSpd = 1.4;
grounded = 0;
jumpVspd = -7.25;
jumpHspd = 1/38; //moves 1 square every second, to be multiplied
jumpHspdMax = 8;
jumpShootTimerMax = 20;
jumpShootTimer = jumpShootTimerMax;

fallSquatAtkTimerMax = 30;
fallSquatAtkTimer = fallSquatAtkTimerMax;

attackTimerMax = 120;
attackTimer = attackTimerMax;
spd = 1.5;
dir = 0;
aRad = 250;


//attack bounds (origin is spawn point)
leftBarrier = xstart - 160;
rightBarrier = xstart - 10;
columnX = (leftBarrier + rightBarrier) / 2



global.player.canInput = false;
player = global.player;
hpMeter = instance_create_depth(x,y,-5,obj_healthMeterBoss);
