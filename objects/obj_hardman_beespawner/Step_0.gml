
if(!scr_inZone()){
	return;
}

if(place_meeting(x,y,obj_player)){
	if(spawnTimer > 0){
		spawnTimer--;
	} else {
		spawnTimer = spawnTimerMax;
		//spawn bird
		cameraLeft = camera_get_view_x(view_camera[0]);
		cameraRight = camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]);
		cameraY = camera_get_view_y(view_camera[0]);
		
		switch(global.player.face){
			case 3:
			case 4:
			case 5:
				bigbee = instance_create_depth(cameraRight,cameraY + beeDeltaY, depth, obj_hardman_bigbee);
				with(bigbee){
					sideMoving = -1;
					zone = other.zone;
				}
				break;
			case 0:
			case 1:
			case 7:
				bigbee = instance_create_depth(cameraLeft,cameraY + beeDeltaY, depth, obj_hardman_bigbee);
				with(bigbee){
					sideMoving = 1;
					zone = other.zone;
				}
				break;
		}
	}
} else {
	if(spawnTimer > 0){
		spawnTimer--;
	} else {
		spawnTimer = spawnTimerStepout;
	}
}