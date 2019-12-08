centerx = x;
centery = y;
if(scr_inView()){
	visible = true;
} else{
	if(!yDone){
		y = endy;
		yDone = true;
	}
	visible = false;
}
if(scr_freezeexit()) return;
if(yDone == 1 and alphaDone == 1){
	return;
}

if(!yDone and y < endy){
	y += dropDelta;
	if(y > (camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]))){
		y = camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0])-1;
		yDone = true;
	}
} else {
	yDone = 1;
}
if(!alphaDone and curAlpha < endAlpha){
	curAlpha += deltaAlpha;
} else {
	alphaDone = 1;
}