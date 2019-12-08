event_inherited();
hspd = 3;
vspd = 0;

ricochet = false;
zone = -1;
isShootable = true;
invincible = false;
isSolid = false;
damageC = 2;
hp = 1;
broken = 0;
dropDistance = 30;
hasEgg = true;

dir = 0;
aRad = 100;
aliveFrames = 60;

egg = instance_create_depth(x,y+sprite_height,depth,obj_airman_enemy_egg);
with(egg){
	fall = false;
}