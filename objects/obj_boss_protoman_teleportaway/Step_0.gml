if(!scr_inView()){
	visible = false;
} else {
	visible = true;
}

if(state == "teleport1"){
	image_index = 0;
	if(teleport1Timer > 0){
		teleport1Timer--;
	} else {
		state = "teleport2";
	}
} else if(state == "teleport2"){
	image_index = 1;
	if(teleport2Timer > 0){
		teleport2Timer--;
	} else {
		state = "teleport3";
	}
} else if(state == "teleport3"){
	image_index = 2;
	vspd += grav;
	y+=vspd;
}

if(aliveFrames > 0){
	aliveFrames--;
} else {
	instance_destroy();
}