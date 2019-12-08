if(keyboard_check_pressed(vk_enter) or gamepad_button_check_pressed(0, gp_start)){
	room_goto(rm_introscreen);
}
if(blinkTimer > 0){
	blinkTimer--;
} else {
	blinkTimer = blinkTimerMax;
}