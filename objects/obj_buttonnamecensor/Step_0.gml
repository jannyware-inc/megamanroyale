if(mouse_check_button_released(mb_left) and instance_position(mouse_x,mouse_y,self)){
	global.namecensor = !global.namecensor;
}

if(global.namecensor){
	sprite_index = spr_button_checked;
} else {
	sprite_index = spr_button_unchecked;	
}