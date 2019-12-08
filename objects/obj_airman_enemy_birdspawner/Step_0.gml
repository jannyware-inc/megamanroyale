
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
			case 0:
			case 1:
			case 7:
				//show_debug_message("birb deployed right");
				//spawn from right
				bird = instance_create_depth(cameraRight,cameraY + birdDeltaY, depth, obj_airman_enemy_bird);
				with(bird){
					hspd = -hspd;
				}
				break;
			case 3:
			case 4:
			case 5:
				//show_debug_message("birb deployed left");
				//else spawn from the left
				bird = instance_create_depth(cameraLeft,cameraY + birdDeltaY, depth, obj_airman_enemy_bird);
				break;
		}
	}
} else {
	spawnTimer = spawnTimerStepout;
}