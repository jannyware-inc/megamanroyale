event_inherited();
state = "fall";
healthprimary = $00B800;
healthsecondary = $18F8B8;
dmg_megabuster = 1;

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
iFrameTimerMax = 30;
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

jumpsMin = 0;
jumpsRandom = 3;
jumpVspd = -5;
jumpHspdMin = -1.5;
jumpHspd = 0;
jumpHspdRandom = 3;
jumps = jumpsMin + irandom(jumpsRandom);
shakeTimerMax = 30;
shakeTimer = 0;

catchTimerMax = 15;
catchTimer = catchTimerMax;

throwTimerMax = 60;
throwTimer= throwTimerMax;

stompVspd = -6;

landingTimerMax = 30;
landingTimer = landingTimerMax;

jumpSquatTimerMax = 15;
jumpSquatTimer = jumpSquatTimerMax;

sleepTimerMax = 120;
sleepTimer = sleepTimerMax;

fallSquatTimerMax = 5;
fallSquatIntroTimerMax = 20;
fallSquatTimer = fallSquatIntroTimerMax;

sleepIntroTimerMax = 40;
sleepIntroTimer = sleepIntroTimerMax;

runSpd = 1.4;
sideFacing = -1;
grav = .23;

hurtTimer1Max = 20;
hurtTimer1 = hurtTimer1Max;
hurtVspd = -1;

grounded = 0;

fallSquatAtkTimerMax = 30;
fallSquatAtkTimer = fallSquatAtkTimerMax;

idleTimerMax = 180;
idleTimer = idleTimerMax;

global.player.canInput = false;
player = global.player;
hpMeter = instance_create_depth(x,y,-5,obj_healthMeterBoss);
boulder = noone;

fg = layer_get_id("fg");
bg = layer_get_id("bg");