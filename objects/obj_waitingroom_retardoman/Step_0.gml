centerx = x;
centery = y;
if(scr_inView()){
	visible = true;
} else{
	visible = false;
}


if(state == "screem"){
	visible = false;
	if(screemTimer > 0){
		screemTimer--;
	} else {
		game_end();
	}
}

if(hurt){
	state = "screem";
	audio_stop_all();
	scr_playNoOverlap(snd_screem);
	with(obj_music_spawner){
		stop = true;
	}
}


if (place_meeting(x,y,obj_player)){
	scr_hurt(damageC,0);
	state = "screem";
	audio_stop_all();
	scr_playNoOverlap(snd_screem);
	with(obj_music_spawner){
		stop = true;
	}
}