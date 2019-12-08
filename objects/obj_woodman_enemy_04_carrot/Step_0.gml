//target = instance_nearest(x, y, obj_player);
centerx = x+sprite_width/2;
centery = y+sprite_height/2;
if(!scr_inZoneOrView()){
	scr_explodeSmall();
	instance_destroy();
}
if(scr_freezeexit()) return;
if(hspd > 0)
	sprite_index = spr_woodman_enemy_04_carrot_mirror;
if(aliveFrames > 0){
	if (place_meeting(x,y,global.player))
			scr_hurt(damageC,0);
	aliveFrames--;
	x += hspd;
	y += vspd;
} else {
	instance_destroy();
}
