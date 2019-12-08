var data = json_decode(argument[0]);
global.lobbyCurrent = data[? "c"];
global.lobbyTarget = data[? "t"];
//show_debug_message("total players online: " + data[? "t"]);