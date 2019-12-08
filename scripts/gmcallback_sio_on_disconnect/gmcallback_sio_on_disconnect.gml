show_debug_message("we got disconnected from server!");
room_goto(rm_disconnect);
global.connected = 0;
global.server = 0;