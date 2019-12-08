blinkTimer++;
if(blinkTimer >= 60){
	blinkTimer = 0;
}

if(button.focus == true and global.server == 0){
	button.focus = false;
}


if(rebindButton.focus == true){
	rebindButton.focus = false;
	room_goto(rm_rebind);
}

if(singleplayerButton.focus == true){
	singleplayerButton.focus = false;
	room_goto(rm_stageselect);
}


if((button.focus == true or ((keyboard_check_pressed(vk_enter) or gamepad_button_check_pressed(0,gp_start)or gamepad_button_check_pressed(4,gp_start))and nameInput.focus == 0)) and global.server == 1 and nameInput.input != ""){
	global.username = nameInput.input;
	global.updatePosition = true;
	scr_savegamedata();
	sio_emit_create_player();
	global.connected = 1;
	//scr_network_emitter_other("create_player",data);
	room_goto(rm_waitingroom);
	audio_stop_all();
}

