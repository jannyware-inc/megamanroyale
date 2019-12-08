var data = json_decode(argument[0]);
var total = data[? "t"];
var alive = data[? "c"];
//show_debug_message("Boss defeated by " + string(username) + " at place " + string(pos));
if(instance_exists(global.roomPlayers)){
	global.roomPlayers.totalPlayers = total;
	global.roomPlayers.alivePlayers = alive;
}