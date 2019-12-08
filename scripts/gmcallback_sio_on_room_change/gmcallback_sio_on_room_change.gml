var data = json_decode(argument[0]);

var rm = round(data[? "room"]);

show_debug_message(string("Moving to room " + string(rm)));

if(rm < 100){
	room_goto(scr_get_room_index(rm));
} else {
	global.roomGoto = scr_get_room_index(rm);
	room_goto(rm_stageIntro);
}