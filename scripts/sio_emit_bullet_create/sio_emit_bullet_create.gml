var eventName = "bullet_create";
#region packet
	var data = ds_map_create();
		data[? "x"] = x;
		data[? "y"] = y;
		data[? "dir"] = dir;
		data[? "w"] = weaponid;
		data[? "f"] = frames;
		data[? "s"] = spd;
		//data[? "id"] = ID;
		data[? "idn"] = idn;
		sio_emit(eventName, json_encode(data));
	ds_map_destroy(data);
#endregion
