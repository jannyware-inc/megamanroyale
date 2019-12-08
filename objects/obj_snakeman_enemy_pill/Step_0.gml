centerx = x+sprite_width/2;
centery = y+sprite_height/2;
//target = instance_nearest(x, y, obj_player);
if(!scr_inZoneAndView())
	instance_destroy();
	
if(hp <= 0){
	scr_explodeSmall();
	scr_dropPickups(3);
	instance_destroy();
}
if(scr_freezeexit()) return;
	

if (place_meeting(x,y,obj_player)){
	scr_hurt(damageC,0);
	broken = 1;
} else if (place_meeting(x,y,obj_wall)){
	broken = 1;
}
aliveFrames--;
vspd+=grav;
x += hspd;
y += vspd;	

if(broken == 1){
	scr_explodeSmall();
	instance_destroy();
}

if(scr_playerSide() > 0){
	sprite_index = spr_snakeman_enemy_pillright;
} else {
	sprite_index = spr_snakeman_enemy_pillleft;
}