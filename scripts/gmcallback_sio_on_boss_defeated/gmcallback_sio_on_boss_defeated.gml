var data = json_decode(argument[0]);
var username = scr_namefilter((data[? "username"]));
var pos = data[? "pos"];
show_debug_message("Boss defeated by " + string(username) + " at place " + string(pos));

if(pos == 0){
	with(instance_create_depth(0,0,-500,obj_winSign)){
		text = string(username) + " has finished in 1st place!";
	}
	if(instance_exists(global.roomPlayers)){
		global.roomPlayers.first = "1st: " + string(username);
	}
} else if (pos == 1){
	with(instance_create_depth(0,0,-500,obj_winSign)){
		text = string(username) + " has finished in 2nd place!";
	}
	if(instance_exists(global.roomPlayers)){
		global.roomPlayers.second = "2nd: " + string(username);
	}
} else if (pos == 2){
	with(instance_create_depth(0,0,-500,obj_winSign)){
		text = string(username) + " has finished in 3rd place!";
	}
	if(instance_exists(global.roomPlayers)){
		global.roomPlayers.third = "3rd: " + string(username);
	}
}

if(instance_exists(global.roomPlayers)){
	global.roomPlayers.position = pos;
}