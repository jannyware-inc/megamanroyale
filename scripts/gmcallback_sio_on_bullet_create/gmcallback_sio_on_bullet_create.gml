return;

var data = json_decode(argument[0]);

if(!instance_exists(global.playerID[? data[? "id"]]) or (instance_exists(global.playerID[? data[? "id"]]) and scr_get_room(room) != global.playerID[? data[? "id"]].curRoom)){
	return;
}
if(data[? "w"] == 0 or data[? "w"] == 1){ //megabuster or metalblade
	with(instance_create_depth(data[? "x"], data[? "y"], 0, obj_remoteBullet)){
		ds_map_add(global.bulletID,data[? "ids"],id);
		dir = data[? "dir"];
		weaponid = data[? "w"];
		frames = data[? "f"];
		spd = data[? "s"];
	}
} else if (data[? "w"] == 2){ //search snake
	with(instance_create_depth(data[? "x"], data[? "y"], 0, obj_remotesearchsnake)){
		ds_map_add(global.bulletID,data[? "ids"],id);
		if(data[? "dir"] > 90 and data[? "dir"] < 270){
			sideMoving = -1;
		} else {
			sideMoving = 1;
		}
		
		//dir = data[? "dir"];
		weaponid = data[? "w"];
		//show_debug_message("Frames = " + string(data[? "f"]));
		frames = data[? "f"];
		spd = data[? "s"];
	}
} else if (data[? "w"] == 3){ //airshooter
	with(instance_create_depth(data[? "x"], data[? "y"], 0, obj_remoteairshooterspawner)){
		
		if(data[? "dir"] > 90 and data[? "dir"] < 270){
			sideFacing = -1;
		} else {
			sideFacing = 1;
		}
		
		//dir = data[? "dir"];
		weaponid = data[? "w"];
		//show_debug_message("Frames = " + string(data[? "f"]));
		//frames = data[? "f"];
		//spd = data[? "s"];
	}
} else if (data[? "w"] == 4){ //rushcoil
	with(instance_create_depth(data[? "x"], data[? "y"], 0, obj_remoterushcoil)){
		dir = data[? "dir"];
		//dir = data[? "dir"];
		weaponid = data[? "w"];
		//show_debug_message("Frames = " + string(data[? "f"]));
		//frames = data[? "f"];
		//spd = data[? "s"];
	}
}
//show_debug_message("shooter is id: " + data[? "id"]);
if(instance_exists(global.playerID[? data[? "id"]])){
	global.playerID[? data[? "id"]].shootTimer = 15;
}

if(data[? "dir"] > 90 and data[? "dir"] < 270){
	global.playerID[? data[? "id"]].sideFacing = -1;
} else {
	global.playerID[? data[? "id"]].sideFacing = 1;
}