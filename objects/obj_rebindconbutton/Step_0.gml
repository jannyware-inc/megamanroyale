

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
} else if (mouse_check_button_pressed(mb_left) and focus = true) {
	if (label == "??"){
		label = labeldata;
	}
     focus = false;
}

if(focus == true){
	var _input = scr_get_controllerinput();
	if(_input != undefined){
		if(_input == noone){
			bind = noone;
			focus = false;
		} else {
			bind = _input;
			focus = false;
		}
	}
}