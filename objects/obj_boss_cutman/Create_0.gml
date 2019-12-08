event_inherited();
state = "fall";
dmg_megabuster = 3;

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
damageC = 4;
vspd = 0;
hspd = 0;
ricochet = 1;
iFrameTimerMax = 60;
iFrameTimer = 0;
invincible = false;
blinking = false;
sideMoving = -1;
jumpDistance = 100;
hpTimerMax = 3;
hpTimer = hpTimerMax;
homeY = y;
homeX = x;
attacked = 0;
attackedColumn = 0;
turnx = xstart;

hasHat = true;

sleepTimerMax = 120;
sleepTimer = sleepTimerMax;

fallSquatTimerMax = 5;
fallSquatIntroTimerMax = 20;
fallSquatTimer = fallSquatIntroTimerMax;

sleepIntroTimerMax = 40;
sleepIntroTimer = sleepIntroTimerMax;

#macro RUNTIMERMAX 20+irandom(80);
runTimer = RUNTIMERMAX;
#macro TAUNTTIMERMAX 20+irandom(30);
tauntTimer = TAUNTTIMERMAX;
runSpd = 1.4;
sideFacing = -1;
grav = .35;
#macro TIMEDTHROWTIMERMAX 10+irandom(120);
timedThrowTimer = TIMEDTHROWTIMERMAX;
hurtTimer1Max = 20;
hurtTimer1 = hurtTimer1Max;
hurtVspd = -1;

tauntThrowTimerMax = 60;
tauntThrowTimer = tauntThrowTimerMax;

grounded = 0;

fallSquatAtkTimerMax = 30;
fallSquatAtkTimer = fallSquatAtkTimerMax;

idleTimerMax = 180;
idleTimer = idleTimerMax;
jumpVspd = -8;

fastJumpHspd = 2.1;
slowJumpHspd = .5;
verySlowJumpHspd = .15;
currentJumpHSpd = noone;
fastJumpDistance = 80;
minRunDistance = 20;

throwTimerMax = 5;
throwTimer = throwTimerMax;
windupTimerMax = 15;
windupTimer = windupTimerMax;
windup2TimerMax = 15;
windup2Timer = windup2TimerMax;


cutmanhatmagnet = instance_create_depth(x,y,depth,obj_boss_cutmanhatmagnet);
global.player.canInput = false;
player = global.player;
hpMeter = instance_create_depth(x,y,-5,obj_healthMeterBoss);
