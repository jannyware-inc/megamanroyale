show_debug_message("depreciated function bullet delete");
return;
var data = json_decode(argument[0]);
var ids = data[? "ids"];
//show_debug_message("Boss defeated by " + string(username) + " at place " + string(pos));
if(instance_exists(global.bulletID[? ids])){
	instance_destroy(global.bulletID[? ids]);
}
ds_map_delete(global.bulletID, ids);