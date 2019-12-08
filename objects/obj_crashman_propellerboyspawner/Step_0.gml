centerx = x;
centery = y;
var freezeexit = false;
with(obj_timestopper){
	if(point_distance(x,y,other.centerx,other.centery) < rad){
		freezeexit = true;
	}
}
if(freezeexit){
	return;
}
with(obj_remotetimestopper){
	if(point_distance(x,y,other.centerx,other.centery) < rad){
		freezeexit = true;
	}
}
if(freezeexit){
	return;
}

if(scr_inZoneAndView() and scr_distanceToPlayer() < atkDistance){
	if(spawnTimer > 0){
		spawnTimer--;
	}else{
		spawnTimer=spawnTimerMax;
		if(instance_number(obj_crashman_propellerboy) < maxMobs){
			instance_create_depth(x,y,depth,obj_crashman_propellerboy);
		}
	}
} else {
	spawnTimer = spawnTimerMax;
}