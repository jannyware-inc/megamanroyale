if (intromm == noone){
	intromm = instance_nearest(x,y,obj_intromm);
}

if((keyboard_check_pressed(vk_enter) or gamepad_button_check_pressed(0, gp_start)) and state != "teleport" and state !="startpressed" and state != "menu" and state != "teleportfly"){
	_cameFromStart = true;
	state = "menu";
	waitTimer = 0;
}

if(waitTimer > 0){
	waitTimer--;
	return;
}


if(state == "start"){
	waitTimer = 0;
	state = "msg1";

} else if (state == "msg1"){
	message1 = "In The Year of 1987,";
	message2 = "A killer robot by the name of Mega man";
	singleMessage = false;
	if(msgDurationTimer < msgDurationTimerMax){
		msgDurationTimer++;
	} else {
		msgDurationTimer = 0;
		state = "msg2";
		waitTimer = 20;
	}
} else if (state == "msg2"){
	singleMessage = false;
	message1 = "was created by capcom, and he";
	message2 = "kicked ass for the next 31 years.";
	if(msgDurationTimer < msgDurationTimerMax){
		msgDurationTimer++;
	} else {
		msgDurationTimer = 0;
		state = "msg3";
		waitTimer = 20;
	}
} else if (state == "msg3"){
	singleMessage = true;
	message1 = "now, through the power of high level spaghetti  code and websockets,";
	
	
	if(msgDurationTimer < msgDurationTimerMax){
		msgDurationTimer++;
	} else {
		msgDurationTimer = 0;
		state = "msg4";
		waitTimer = 20;
	}
} else if (state == "msg4"){
	singleMessage = true;
	message1 = "mega man embarks on a new adventure...";
	
	if(msgDurationTimer < msgDurationTimerMax){
		msgDurationTimer++;
	} else {
		msgDurationTimer = 0;
		state = "msg5";
		waitTimer = 20;
	}
} else if (state == "msg5"){
	singleMessage = true;
	message1 = "...but this time, he's not going alone.";
	
	if(msgDurationTimer < msgDurationTimerMax){
		msgDurationTimer++;
	} else {
		msgDurationTimer = 0;
		state = "cameraRoll";
		waitTimer = 20;
	}
} else if (state == "cameraRoll"){
	message1 = "";
	message2 = "";
	boxHeight+= 1;
	//show_debug_message(string(camera_get_view_y(view_camera[0])));
	if(camera_get_view_y(view_camera[0]) > kinoY){
		camera_set_view_pos(view_camera[0],camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0])-2);
		layer_vspeed("bgfront",-1);
	} else {
		camera_set_view_pos(view_camera[0],camera_get_view_x(view_camera[0]), kinoY);
		layer_vspeed("bgfront",0);
		if(musicBox.introMusic == 2){
			state = "menu";

		}
	}
} else if (state == "menu"){
	if(musicBox.introMusic != 2){
		audio_stop_sound(musicBox.musicIntro);
		musicBox.introMusic = 1;
	}
	boxHeight = window_get_height();
	message1 = "";
	message2 = "";
	camera_set_view_pos(view_camera[0],camera_get_view_x(view_camera[0]), kinoY);
	drawLogo = true;
	drawStartText = true;
	if((keyboard_check_pressed(vk_enter) or gamepad_button_check_pressed(0, gp_start)) and !_cameFromStart){
		audio_stop_all();
		state = "startpressed";
		with(obj_intromm){
			image_index = 0;
			sprite_index = spr_intrommhelmet;
		}
		audio_stop_all();
		musicBox.pause = true;
	}
} else if (state == "startpressed"){
	if(helmetTimer > 0){
		helmetTimer--;
	} else {
		state = "teleport";
		audio_play_sound(snd_teleport,100,0);
		with(obj_intromm){
			image_index = 0;
			sprite_index = spr_teleport;
		}
	}
} else if (state == "teleport"){
	if(teleportTimer > 0){
		teleportTimer--;
	} else {
		state = "teleportfly";
	}
} else if (state == "teleportfly"){
	with(obj_intromm){
		image_index = 2;
	}
	if(teleportFlyTimer > 0){
		teleportFlyTimer--;
		with(obj_intromm){
			y += other.flyY;
		}
	} else {
		room_goto(rm_name);
	}
}


if(msgDurationTimer == 0 or msgDurationTimer == msgDurationTimerMax){
textColor = $000000;
} else if((msgDurationTimer > fade1 and msgDurationTimer < fade2) or (msgDurationTimer + fade1 > msgDurationTimerMax)){
	//show_debug_message("fade1");
	textColor = $444444;
} else if((msgDurationTimer > fade2 and msgDurationTimer < fade3) or (msgDurationTimer + fade2 > msgDurationTimerMax)){
	//show_debug_message("fade2");
	textColor = $AAAAAA;
} else if(msgDurationTimer > fade3){
	//show_debug_message("fade3");
	textColor = $FFFFFF
}
_cameFromStart = false;