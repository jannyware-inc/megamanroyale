cameraCenterX = (camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0])/2);
cameraCenterY = (camera_get_view_y(view_camera[0])+ camera_get_view_height(view_camera[0])/2);
with(obj_player){
	instance_destroy();
}
with(obj_remotePlayer){
	instance_destroy();
}

if(global.server){
	room_goto(rm_name);
}
