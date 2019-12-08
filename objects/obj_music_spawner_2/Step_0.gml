if(keyboard_check_pressed(ord("S")) and keyboard_check_pressed(ord("N")) and keyboard_check_pressed(ord("I")) and keyboard_check_pressed(ord("P")) and keyboard_check_pressed(ord("E"))){
	musicIntro = mus_millionairesholiday;
	musicLoop = mus_millionairesholiday;
	introMusic = 0;
	audio_stop_sound(currentMusic);
}

if(destroy){
	audio_stop_sound(currentMusic);
	instance_destroy();
}

if(stop == true){
	introMusic = 0;
	audio_stop_sound(currentMusic);
	if(stageMusic == false){
		show_debug_message("music destroyed");
		instance_destroy();
	}
} else {
	if(introMusic == 0 and !audio_is_playing(currentMusic)){
		currentMusic = audio_play_sound(musicIntro,100,0);
		introMusic = 1;
	} else if (introMusic == 1 and !audio_is_playing(currentMusic)){
		audio_stop_sound(currentMusic);
		currentMusic = audio_play_sound(musicLoop,100,1);
		introMusic = 2;
	} else if (introMusic == 2){
		//do nothing, the music is already looping
	}
}