if(scr_inZoneAndOutView() and player.x < x){
	if(spawnTimer > 0)
		spawnTimer--;
	else{
		spawnTimer = spawnTimerMax;
		spawnInstance = instance_create_depth(camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) +16 ,y,0,spawnObj);
		with(spawnInstance){
			zone = other.zone;
		}
	}
}