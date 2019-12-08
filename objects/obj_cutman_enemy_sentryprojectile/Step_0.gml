//target = instance_nearest(x, y, obj_player);
centerx = x;
centery = y;
if(!scr_inZoneOrView())
	instance_destroy();
	
var freezeexit = false;
with(obj_timestopper){
	if(point_distance(x,y,other.centerx,other.centery) < rad){
		freezeexit = true;
	}
}
if(freezeexit){
	image_index -= sprite_get_speed(sprite_index)/60*image_speed;
	return;
}
with(obj_remotetimestopper){
	if(point_distance(x,y,other.centerx,other.centery) < rad){
		freezeexit = true;
	}
}
if(freezeexit){
	image_index -= sprite_get_speed(sprite_index)/60*image_speed;
	return;
}


if (place_meeting(x,y,obj_player))
	scr_hurt(damageC,0);

	
if(dirgen = false){
	hspd = lengthdir_x(spd,dir);
	vspd = lengthdir_y(spd,dir);
	dirgen = true;
}

if(aliveFrames > 0){
	
	aliveFrames--;

} else {
	instance_destroy();
}

	x += hspd;
	y += vspd;