if(mouse_check_button_released(mb_left) and instance_position(mouse_x,mouse_y,self)){
	if(global.costume == 1){
		global.costume = 0;
	} else {
		global.costume = 1;
	}
}

if(global.costume == 1){
	sprite_index = spr_button_checked;
} else {
	sprite_index = spr_button_unchecked;	
}