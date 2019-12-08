if(returnButton.focus == true){	
	returnButton.focus = false;
	room_goto(rm_name);
}

with(obj_button){
	if(focus){
		if(!is_undefined(gotostage))
			room_goto(gotostage);
	}
}