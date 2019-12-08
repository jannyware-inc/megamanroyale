event_inherited();
hspd = 0;

vspd = 0;
wasHurt = 0;
zone = -1;
isShootable = true;
ricochet = false;
invincible = false;
hurt = 0;
isSolid = false;
damageC = 1;
hp = 5;
if(instance_exists(global.player))
	blowForce = global.player.spd*(.4);
else
	blowForce = 3; //change this

state = "sleep";
sleepTimerMax = 120;
sleepTimer = 30;

atkDist = 220;

chargeTimerMax = 4;
chargeTimer = chargeTimerMax;

blowTimerMax = 60;
blowTimer = blowTimerMax;


dir = 0;

player = global.player;