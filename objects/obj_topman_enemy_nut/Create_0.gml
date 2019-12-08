event_inherited();
//enemy Flags
isShootable = true;
ricochet = true;
hp = 1;
damageC = 2;
zone = -1;
hurt = 0;
wasHurt = 0;
spd = .5;
invincible = false;
//position
homeY = y;
homeX = x;
sideFacing = -1;

//timers, etc

state = "waitInDist";
screwDistance = 260;
nutldistanceStart = -240;
nutldistance = nutldistanceStart;
nutlTimerMax = 60;
nutlTimer = nutlTimerMax;
screwTimerMax = (60/8)*20;
screwTimer = screwTimerMax;
nutl = instance_create_depth(0,0,depth,obj_topman_enemy_nutl);
with(nutl){
	visible = false;
}