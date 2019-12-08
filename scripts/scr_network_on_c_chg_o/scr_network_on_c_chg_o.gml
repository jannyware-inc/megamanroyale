var data = json_decode(argument[0]);
if(!is_undefined(global.playerID[? data[? "id"]]) and global.playerID[? data[? "id"]] != noone and instance_exists(global.playerID[? data[? "id"]])){
	global.playerID[? data[? "id"]].costume = data[? "c"];
}