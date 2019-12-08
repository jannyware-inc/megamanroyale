if(mouse_check_button_released(mb_left) and instance_position(mouse_x,mouse_y,self)){
	global.lowgfx = !global.lowgfx;
}

if(global.lowgfx){
	sprite_index = spr_button_checked;
} else {
	sprite_index = spr_button_unchecked;	
}