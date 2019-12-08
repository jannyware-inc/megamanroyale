event_inherited();
spd = 5;
zone = -1;

isShootable = false;
isSolid = false;
damageC = 4;
dir = point_direction(x+sprite_width/2,y+sprite_height/2,global.playerCenterx,global.player.y);

aliveFrames = 440;
damageC = 3;
dirgen = false;
grounded = 0;
wallCollide = 0;

blinkTimer = 30;
explodeTimer = 18*3;
sideFacing = 1;
state = "shoot";