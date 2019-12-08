centerx = x;
centery = y;
if(!scr_inZone()){
	return;
}

if(place_meeting(x,y,obj_player)){
	if(spawnTimer > 0){
		spawnTimer--;
	} else if (instance_number(obj_metalman_enemy_drill) < 8){
		spawnTimer = spawnTimerMax;
		//spawn drill
		//cameraLeft = camera_get_view_x(view_camera[0]);
		//cameraRight = camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]);
		cameraY = camera_get_view_y(view_camera[0]);
		
		switch(global.player.face){
			case 0:
			case 1:
			case 7:
				//show_debug_message("birb deployed right");
				//spawn from right
				drill = instance_create_depth(global.player.x+irandom(spawnDelta),cameraY, depth, obj_metalman_enemy_drill);
				with(drill){
					if(irandom(1) == 0){ //spawn from top
						vsideFacing = 1;
						y = other.cameraY + other.drillTopY;
					} else {
						vsideFacing = -1;
						y = other.cameraY + other.drillBottomY;
					}
				}
				break;
			case 3:
			case 4:
			case 5:
				//show_debug_message("birb deployed left");
				//else spawn from the left
				drill = instance_create_depth(global.player.x-irandom(spawnDelta),cameraY, depth, obj_metalman_enemy_drill);
				with(drill){
					if(irandom(1) == 0){ //spawn from top
						vsideFacing = 1;
						y = other.cameraY + other.drillTopY;
					} else {
						vsideFacing = -1;
						y = other.cameraY + other.drillBottomY;
					}
				}
				break;
		}
	}
} else {
	spawnTimer = spawnTimerStepout;
}