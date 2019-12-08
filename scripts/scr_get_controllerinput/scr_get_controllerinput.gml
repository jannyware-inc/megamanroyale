if(gamepad_button_check_pressed(0,gp_padd)||gamepad_button_check_pressed(4,gp_padd)){
	return gp_padd;
}
if(gamepad_button_check_pressed(0,gp_padu)||gamepad_button_check_pressed(4,gp_padu)){
	return gp_padu;
}
if(gamepad_button_check_pressed(0,gp_padl)||gamepad_button_check_pressed(4,gp_padl)){
	return gp_padl;
}
if(gamepad_button_check_pressed(0,gp_padr)||gamepad_button_check_pressed(4,gp_padr)){
	return gp_padr;
}
if(gamepad_button_check_pressed(0,gp_face1)||gamepad_button_check_pressed(4,gp_face1)){
	return gp_face1;
}
if(gamepad_button_check_pressed(0,gp_face2)||gamepad_button_check_pressed(4,gp_face2)){
	return gp_face2;
}
if(gamepad_button_check_pressed(0,gp_face3)||gamepad_button_check_pressed(4,gp_face3)){
	return gp_face3;
}
if(gamepad_button_check_pressed(0,gp_face4)||gamepad_button_check_pressed(4,gp_face4)){
	return gp_face4;
}
if(gamepad_button_check_pressed(0,gp_shoulderr)||gamepad_button_check_pressed(4,gp_shoulderr)){
	return gp_shoulderr;
}
if(gamepad_button_check_pressed(0,gp_shoulderl)||gamepad_button_check_pressed(4,gp_shoulderl)){
	return gp_shoulderl;
}
if(gamepad_button_check_pressed(0,gp_shoulderrb)||gamepad_button_check_pressed(4,gp_shoulderrb)){
	return gp_shoulderrb;
}
if(gamepad_button_check_pressed(0,gp_shoulderlb)||gamepad_button_check_pressed(4,gp_shoulderlb)){
	return gp_shoulderlb;
}
if(gamepad_button_check_pressed(0,gp_select)||gamepad_button_check_pressed(4,gp_select)){
	return gp_select;
}
if(gamepad_button_check_pressed(0,gp_start)||gamepad_button_check_pressed(4,gp_start)){
	return gp_start;
}
if(keyboard_check_pressed(vk_delete) or keyboard_check_pressed(vk_backspace)){
	return noone;
}
return undefined;