if(delay >0){
	delay--;
	return;
}

if(destroy){
	audio_stop_sound(currentMusic);
	instance_destroy();
}

if(stop == true){
	audio_stop_sound(currentMusic);
	if(stageMusic == false){
		show_debug_message("music destroyed");
		instance_destroy();
	}
} else {
	if (!audio_is_playing(currentMusic)){
		if (played == 0){
			currentMusic = audio_play_sound(music,2,0);
			//audio_sound_gain(currentMusic, .4, 0);
			played = 1;
		} else{
			currentMusic = audio_play_sound(music,2,0);
			audio_sound_set_track_position(currentMusic,loopstart);
		}
	}
}	