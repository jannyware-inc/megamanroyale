if(!isReady and keyboard_check_pressed(vk_f2)){
	isReady = true;
	//sio_emit_ready_up();
	scr_network_emitter_other("ready_up",noone);
}

if(countdownTimer != noone){
	countdownTimer -= delta_time;
	if (countdownTimer < 0){
		countdownTimer = 0;
	}
}
