/// @desc playNoOverlap(audioTrack)
/// @arg audioTrack


audioTrack = argument0;

if(audio_is_playing(audioTrack))
		audio_stop_sound(audioTrack);		
	audio_play_sound(audioTrack,11,0);