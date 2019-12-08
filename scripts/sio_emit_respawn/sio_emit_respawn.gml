var eventName = "respawn";

#region packet
	var data = ds_map_create();
		data[? "x"] = x;
		data[? "y"] = y;
		data[? "d"] = 0;
		sio_emit(eventName, json_encode(data));
	ds_map_destroy(data);
#endregion
