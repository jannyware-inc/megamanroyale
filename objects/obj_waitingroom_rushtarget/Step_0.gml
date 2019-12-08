centerx = x;
centery = y;
if(scr_inView()){
	visible = true;
} else{
	visible = false;
}

if(!scr_inZoneOrView()){
	scr_goHome();
	state = "sleep";
	dir = startdir;
	return;
}
if(hurt){
	if(global.rush = dat_rushcoil){
		global.rush = dat_rushjet;
	} else {
		global.rush = dat_rushcoil;
	}
	global.player.weapons[4] = instance_create_depth(0,0,0,global.rush);
}
scr_hurtblink();
if(hp <= 0){
	scr_playNoOverlap(snd_affun);
	scr_explodeSmall();
	instance_destroy();
}

var freezeexit = false;
with(obj_timestopper){
	if(point_distance(x,y,other.centerx,other.centery) < rad){
		freezeexit = true;
	}
}
if(freezeexit){
	if(visible){
		image_index -= sprite_get_speed(sprite_index)/60*image_speed;
	}
	return;
}
with(obj_remotetimestopper){
	if(point_distance(x,y,other.centerx,other.centery) < rad){
		freezeexit = true;
	}
}
if(freezeexit){
	if(visible){
		image_index -= sprite_get_speed(sprite_index)/60*image_speed;
	}
	return;
}


if (place_meeting(x,y,obj_player))
	scr_hurt(damageC,0);