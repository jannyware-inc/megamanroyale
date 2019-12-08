global.player.dead = 4;

if(waitTimer == 1){
	// what the fuck, why doesn't this work?????
	with(instance_create_depth(0,0,0,obj_music_spawner_2)){
		if(global.oldmusic){
			musicIntro = mus_mm3gameover;
			musicLoop = mus_mm3gameover;
		} else {
			if(room == rm_airman){
				musicIntro = mus_icantbeatairman;
				musicLoop = mus_icantbeatairman
			} else {
				musicIntro = mus_mm3gameoverDiggiDis;
				musicLoop = mus_mm3gameoverDiggiDis;
			}
		}
	}
	//audio_play_sound(mus_mm3gameoverDiggiDis,100,true);
	

}

if(waitTimer > 0){
	waitTimer--;
	return;
}

if (drawTimer > 0){
	drawTimer--;
} else {
	drawTimer = drawTimerMax;
}
if(drawTimer > 30){
	drawGameOver = true;
} else {
	//drawGameOver = false;
}

if(keyboard_check_pressed(vk_enter) or gamepad_button_check_pressed(0,gp_start)){		
	//sio_emit_room_disconnect();
	scr_network_emitter_other("room_disconnect",noone);
	room_goto(rm_name);
}