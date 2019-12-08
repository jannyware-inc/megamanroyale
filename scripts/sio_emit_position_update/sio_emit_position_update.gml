return;
var eventName = "position_update";

#region packet
	var data = ds_map_create();
		data[? "x"] = x;
		data[? "y"] = y;
		data[? "s"] = sliding;
		data[? "h"] = hurt;
		data[? "l"] = onLadder;
		data[? "r"] = scr_get_room(room);
		data[? "w"] = scr_get_weapon_id();
		//show_debug_message("onladder sent: " + string(onLadder));
		sio_emit(eventName, json_encode(data));
	ds_map_destroy(data);
#endregion
