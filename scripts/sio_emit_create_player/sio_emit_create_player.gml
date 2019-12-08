/// sio_emit_create_player()
/// @descr Send player creation packet to the server

var eventName = "create_player";
//var username = get_string("Enter your username", "player" + string(random(999)));
var username = global.username;

#region packet
	var data = ds_map_create();
		data[? "username"] = username;
		data[? "c"] = global.costume;
		sio_emit(eventName, json_encode(data));
	ds_map_destroy(data);
#endregion
