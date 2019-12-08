var eventName = "die";

#region packet
	var data = ds_map_create();
		data[? "x"] = x;
		data[? "y"] = y;
		data[? "d"] = 1;
		sio_emit(eventName, json_encode(data));
	ds_map_destroy(data);
#endregion
