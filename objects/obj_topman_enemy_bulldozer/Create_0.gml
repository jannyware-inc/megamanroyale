event_inherited();
//enemy Flags
isShootable = true;
ricochet = false;
hp = 3;
damageC = 3;
zone = -1;
hurt = 0;
wasHurt = 0;
invincible = false;
//position
homeY = y;
homeX = x;
spd = 1.6;
hspd = 0;
vspd = 0;

sideFacing = -1;
grounded = 0;
#macro IDLETIMERMAX 30+irandom(30);
idleTimer = IDLETIMERMAX;
#macro MOVETIMERMAX 30+irandom(30);
moveTimer = MOVETIMERMAX;

reflector = instance_create_depth(x,y,depth-100,obj_topman_enemy_bulldozerreflector);
grounder = instance_create_depth(x,y,depth-100,obj_topman_enemy_bulldozergrounddetector);
with(reflector){
	visible = false;
}
with(grounder){
	visible = false;
}
grounderX = 16;

//timers, etc
state = "move";
