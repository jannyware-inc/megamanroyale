//target = instance_nearest(x, y, obj_player);
if(!scr_inZoneAndView())
	instance_destroy();
	
if(hp <= 0){
	scr_explodeSmall();
	instance_destroy();
}
if(scr_freezeexit()) return;

if (place_meeting(x,y,obj_player)){
	scr_hurt(damageC,0);
}
hspd = sideFacing * spd;
aliveFrames--;
x += hspd;

if(sideFacing > 0){
	sprite_index = spr_snakeman_enemy_shotputguy_ballright;
} else {
	sprite_index = spr_snakeman_enemy_shotputguy_ballleft;
}