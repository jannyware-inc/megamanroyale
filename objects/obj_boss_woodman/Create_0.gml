event_inherited();
state = "fall";

hpMax = 28;
hp = 0;
zone = -1;
invincible = false;
homeY = y;
isShootable = true;
isSolid = false;
hurt = 0;
damageC = 3;
vspd = 0;
hspd = 0;
ricochet = 1;
blinking = false;
wasHurt = 0;
lastUpLeaf = 0; //last leaf thrown up
hpTimerMax = 3;
hpTimer = hpTimerMax;
homeY = y;
homeX = x;

iFrameTimerMax = 10;
iFrameTimer = 0;

currentLeafShield = 0;
leaf1 = 0;
leaf2 = 0;
leaf3 = 0;
leaf4 = 0;

sleepTimerMax = 120;
sleepTimer = sleepTimerMax;

leafSpitTimerMax = 20;
leafSpitTimer = 0;
leafShieldWindUpTimerMax = 6;
leafShieldWindUpTimer = leafShieldWindUpTimerMax;


downLeafDeltaX = 60;
downLeafDeltaY = 30;
fallSquatIntroTimerMax = 20;
fallSquatIntroTimer=fallSquatIntroTimerMax;
fallSquatTimerMax = 80;
fallSquatTimer = fallSquatTimerMax;

maxLeaves = 4;
leaves = maxLeaves;

thumpTimerMax = 120;
thumpTimer = thumpTimerMax;

runTimerMax = 25;
runTimer = runTimerMax;

hopHspd = 1.1;
hopVspd = -3.75;
grav = .25;
mirror = 1;

grounded = 0;

attackTimerMax = 90;
attackTimer = attackTimerMax;
spd = 1.5;
dir = 0;
aRad = 250;

global.player.canInput = false;


stopAnimations = false;

player = instance_nearest(x, y, obj_player);
hpMeter = instance_create_depth(x,y,-5,obj_healthMeterBoss);

centerx = x + sprite_width/2;
centery = y + sprite_height/2;