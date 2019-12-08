var freezeexit = false;
with(obj_timestopper){
	if(point_distance(x,y,other.centerx,other.centery) < rad){
		freezeexit = !freezeexit;
	}
}
if(freezeexit){
	if(visible){
		image_index -= sprite_get_speed(sprite_index)/60*image_speed;
		if(image_index < 0){
			image_index = 0;
		}
	}
	return true;
}
if(global.nopvp){ //if there's no PVP, enemies will not react to other players' time stoppers
	return freezeexit;
}
with(obj_remotetimestopper){
	if(point_distance(x,y,other.centerx,other.centery) < rad){
		freezeexit = !freezeexit;
	}
}
if(freezeexit){
	if(visible){
		image_index -= sprite_get_speed(sprite_index)/60*image_speed;
		if(image_index < 0){
			image_index = 0;
		}
	}
	return true;
}

return false;