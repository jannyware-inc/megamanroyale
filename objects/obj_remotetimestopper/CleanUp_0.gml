if(!is_undefined(global.playerID[? owneruID]) and instance_exists(global.playerID[? owneruID])){
	global.playerID[? owneruID].activeTimeStopper = false;	
} else {
	show_debug_message("time stopper owner not found");
}