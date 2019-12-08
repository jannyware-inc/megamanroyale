var data = json_decode(argument[0]);
//show_debug_message("Someone else has respawned!");
if(!is_undefined(global.playerID[? data[? "id"]]) and global.playerID[? data[? "id"]] != noone and instance_exists(global.playerID[? data[? "id"]])){
	global.playerID[? data[? "id"]].x = data[? "x"];
	global.playerID[? data[? "id"]].y = data[? "y"];
	global.playerID[? data[? "id"]].gotox = data[? "x"];
	global.playerID[? data[? "id"]].gotoy = data[? "y"];
	global.playerID[? data[? "id"]].dead = data[? "d"];
	global.playerID[? data[? "id"]].invisible = 0;
}