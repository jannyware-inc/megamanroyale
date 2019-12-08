event_inherited();
state = "fall";

hpMax = 28;
hp = 0;
zone = -1;
hurt = 0;
wasHurt = 0;
homeY = y;
isShootable = true;
isSolid = false;
blowForce = global.player.spd*(1.5);
damageC = 3;
iFrameTimerMax = 20;
iFrameTimer = 0;
invincible = false;
vspd = 0;
hspd = 0;
ricochet = 1;
tornadoRoundsMax = 3;
tornadoRounds = tornadoRoundsMax;
blinking = false;


smallHopVspd = -5;
bigHopVspd = -8;

blowTimerMax = 120;
blowTimer = blowTimerMax;

shootTimerMax = 60;
shootTimer = shootTimerMax;

lastUpLeaf = 0; //last leaf thrown up
hpTimerMax = 3;
hpTimer = hpTimerMax;
homeY = y;
homeX = x;

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

fallSquatTimerMax = 20;
fallSquatTimer = fallSquatTimerMax;

maxLeaves = 4;
leaves = maxLeaves;

jumpIndex = 1;
thumpTimerMax = 120;
thumpTimer = thumpTimerMax;
sideFacing = -1;
runTimerMax = 25;
runTimer = runTimerMax;

tornadoCount = 6;
tornadoShootXoffset = 4;
tornadoShootYoffset = 7;

hopHspd = 1.4;
//hopVspd = -3.75;
grav = .25;
mirror = 1;

grounded = 0;

attackTimerMax = 90;
attackTimer = attackTimerMax;
spd = 1.5;
dir = 0;
aRad = 250;

global.player.canInput = false;
centerx = x + sprite_width/2;
centery = y + sprite_height/2;

stopAnimations = false;

player = instance_nearest(x, y, obj_player);
hpMeter = instance_create_depth(x,y,-5,obj_healthMeterBoss);
