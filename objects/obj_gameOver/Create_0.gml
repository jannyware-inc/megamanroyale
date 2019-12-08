with(obj_music_spawner){
	stop = true;
}
drawGameOver = false;
drawTimerMax = 60;
drawTimer = drawTimerMax;
if(instance_exists(global.player) and global.player.hasTimer){
	global.player.timer.stop = true;
}
sio_emit_set_spectate();

waitTimer = 120;
camW = camera_get_view_width(view_camera[0]);
camH = camera_get_view_height(view_camera[0]);
