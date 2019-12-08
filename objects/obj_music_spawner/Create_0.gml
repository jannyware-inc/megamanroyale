delay = 5;
loopstart = 0;
played = 0;
stop = false;
currentMusic = snd_shake;
stageMusic = false;
destroy = 0;
music = noone;

audio_stop_all();
with(obj_music_spawner){
	stop = true;
	if(stageMusic and id!= other.id){
		//show_debug_message("stopping");
		stop = 1;
	}
}
stop = false;