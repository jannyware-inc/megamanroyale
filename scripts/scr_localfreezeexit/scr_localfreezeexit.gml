var freezeexit = false;
with(obj_timestopper){
	if(point_distance(x,y,other.centerx,other.centery) < rad){
		freezeexit = !freezeexit;
	}
}

if(object_index == obj_remoteBullet or object_index == obj_remoterush){
	with(obj_remotetimestopper){
		if(owneruID != other.owneruID and point_distance(x,y,other.centerx,other.centery) < rad){
			freezeexit = !freezeexit;
		}
	}
}

if(object_index == obj_remotePlayer){
	//show_debug_message("peen");
	if(activeTimeStopper){
		return false;
	}else {
		with(obj_remotetimestopper){
			if(owneruID != other.uID and point_distance(x,y,other.centerx,other.centery) < rad){
				freezeexit = !freezeexit;
			}
		}
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