
if(!heightGen){
	y = -height;
	x = camera_get_view_width(view_camera[0])/2;
	heightGen = true;
}
if(!textHeightGen){
	textHeightGen = true;
	draw_set_font(fnt_joystix);
	width = string_width(text) + 16;
}
if(state == "drop"){
	y = ceil(lerp(y,gotoY,.1));
	if(dropTimer > 0){
		dropTimer--;
	} else {
		state = "display";
	}
} else if(state == "display"){
	if(displayTimer > 0){
		displayTimer--;
	} else {
		state = "rise";
		gotoY = -height;
	}
} if(state == "rise"){
	y = floor(lerp(y,gotoY,.1));
	if(riseTimer > 0){
		riseTimer--;
	} else {
		instance_destroy();
	}
}