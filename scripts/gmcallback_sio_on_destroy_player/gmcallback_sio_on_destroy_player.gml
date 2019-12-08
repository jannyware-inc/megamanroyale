show_debug_message("This is a discontinued function. ondestroyplayer");
return;
var data = json_decode(argument[0]);

//_uID = data[? "id"];
show_debug_message("Destroying player uid: " + string(data[? "id"]));
if(instance_exists(global.playerID[? data[? "id"]])){
	instance_destroy(global.playerID[? data[? "id"]]);
	ds_map_delete(global.playerID,data[? "id"]);
}