if(instance_position(mouse_x,mouse_y,self)){
	image_speed = 1;
} else {
	image_index = 0;
}

if(mouse_check_button_released(mb_left) and instance_position(mouse_x,mouse_y,self)){
	url_open_ext("https://discord.gg/7w7Ru42","_blank");
}