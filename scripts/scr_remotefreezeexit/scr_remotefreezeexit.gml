if(global.nopvp){
	return false;
}

var freezeexit = false;
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