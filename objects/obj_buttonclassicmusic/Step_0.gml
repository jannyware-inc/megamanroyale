if(mouse_check_button_released(mb_left) and instance_position(mouse_x,mouse_y,self)){
	global.oldmusic = !global.oldmusic;
	if(global.oldmusic){
		audio_stop_all();
		audio_play_sound(mus_mm2passwordloop,100,true);
	} else {
		audio_stop_all();
		audio_play_sound(mus_mm2PasswordRoryButler,100,true);
	}
}

if(global.oldmusic){
	sprite_index = spr_button_checked;
} else {
	sprite_index = spr_button_unchecked;	
}