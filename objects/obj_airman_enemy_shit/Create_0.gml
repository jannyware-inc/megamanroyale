event_inherited();
spd = 3;

upDistance = 16;

if(scr_distanceToPlayer() < upDistance){
	dir = point_direction(x+sprite_width/2,y+sprite_height/2,global.playerCenterx,global.playerCentery) + 4-random(8);
} else {
	dir = 90 + 25*-sign(global.playerCenterx - x) + 4-random(8);
}

hspd = lengthdir_x(spd,dir);
vspd = -abs(lengthdir_y(spd,dir));
grav = .3;
blinkFrames = 50;
zone = -1;
isShootable = true;
ricochet = false;
isSolid = false;
hp = 5;


dir = 0;
aRad = 100;
aliveFrames = 120;
damageC = 3;