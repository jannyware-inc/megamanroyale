event_inherited();
vspd = 0;
hspd = 0;
grav = .215;
bounceVspd = -7.5;
bounce = 0;
bounceTimerMax = 20;
bounceTimer = 0;
weaponid = 4;
sideFacing = 1;

aliveTimer = 0;
aliveDestroy = 240-60;
teleportgrav = -.5;
teleport = 180-60;

shootHspd = 1;
shootVspd = -1.875;
teleportTimer = 0;
telestate = "tele0";
tele1 = 5;
tele2 = 10;
networkSent = 0;
state = "active";
dirSpd = false;
dir = 0;
//idn = global.bulletIDNum++;
grounded = false;

_wall = instance_place(x,y,obj_wall)
if(_wall != noone and _wall.y > y){
	grounded = true;
}

centerx = x;
centery = y-8;