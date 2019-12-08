

/*
if(!focus){
	label = labeldata;
}
*/
if(!focus){
	label = bind;
}


if (mouse_check_button_pressed(mb_left) and point_in_rectangle(mouse_x, mouse_y, x-10, y, x + 30, y + 20))  {
     focus = true;
	 labeldata = label;
     //keyboard_string = input;
	 label = "??";
	 keyboard_lastkey = noone;
} else if (mouse_check_button_pressed(mb_left) and focus = true) {
	if (label == "??"){
		label = labeldata;
	}
     focus = false;
}

if(focus == true){
	if(keyboard_lastkey != noone){
		if(keyboard_lastkey == vk_backspace or keyboard_lastkey == vk_delete){
			bind = noone;
			focus = false;
		} else {
			bind = keyboard_lastkey;
			focus = false;
		}
	}
}