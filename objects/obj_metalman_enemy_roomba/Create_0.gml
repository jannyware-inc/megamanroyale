event_inherited();
//enemy Flags
isShootable = true;
ricochet = true;
hp = 1;
damageC = 3;
zone = -1;
hurt = 0;
wasHurt = 0;
invincible = false;
//position
homeY = y;
homeX = x;
spd = 0;
hspd = 0;
vspd = 0;
grav = .3;
sideFacing = -1;
grounded = 0;
groundergrounded = true;
attackDistance = 100;
aggrospd = 2.15;
notaggrospd = 1;
bounceTimerMax = 60/8*2;
bounceTimer = bounceTimerMax;
bouncesMax = 10;
bounces = bouncesMax;
grounderOffsetX = 8;
attackY = 2;
//timers, etc
state = "roam";
grounder = instance_create_depth(x+grounderOffsetX*sideFacing,y,depth,obj_metalman_enemy_roombaground);
with(grounder){
	visible = false;
}