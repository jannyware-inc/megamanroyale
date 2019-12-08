/// @desc sio_emit_updateall(masterpacket)
/// @arg masterpacket
var eventName = "updateall";
//show_debug_message("Sending update packet");
#region packet
	sio_emit(eventName, json_encode(argument[0]));
#endregion
