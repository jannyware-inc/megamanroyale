//target = instance_nearest(x, y, obj_player);
centerx = x;
centery = y;
if(!scr_inZoneOrView())
	instance_destroy();
	
if(scr_freezeexit()) return;
if(aliveFrames > 0){
	aliveFrames--;
	vspd+=grav;
	x += hspd;
	y += vspd;
} else {
	instance_destroy();
}

if(hspd < 0){
	sprite_index = spr_airman_enemy_eggshellleft;
} else {
	sprite_index = spr_airman_enemy_eggshellright;
}