var eventName = "bullet_delete_by_idn";

#region packet
	var data = ds_map_create();
		data[? "idn"] = idn;
		sio_emit(eventName, json_encode(data));
	ds_map_destroy(data);
#endregion
