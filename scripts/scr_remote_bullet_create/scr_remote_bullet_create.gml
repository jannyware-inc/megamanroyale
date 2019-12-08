var data = argument[0];
show_debug_message("bullet ID is " + string(data[? "id"]));
show_debug_message("bullet W is " + string(data[? "w"]));

if(is_undefined(global.playerID[? data[? "id"]]) or (global.playerID[? data[? "id"]] == noone or !instance_exists(global.playerID[? data[? "id"]]) or (instance_exists(global.playerID[? data[? "id"]]) and room != global.playerID[? data[? "id"]].curRoom))){
	return; 
}
//show_debug_message("dataw = " + string(data[? "w"]));
if(data[? "w"] == 0 or data[? "w"] == 1){ //megabuster or metalblade
	if(data[? "w"] == 0){
		global.playerID[? data[? "id"]].shootTimer = global.playerID[? data[? "id"]].shootTimerMax;
	} else {
		global.playerID[? data[? "id"]].throwTimer = global.playerID[? data[? "id"]].throwTimerMax;
	}
	with(instance_create_depth(data[? "x"], data[? "y"], global.playerID[? data[? "id"]].depth, obj_remoteBullet)){
		show_debug_message("the id is " + string (data[? "ids"]));
		ds_map_add(global.bulletID,data[? "ids"],id);
		dir = data[? "dir"];
		weaponid = data[? "w"];
		frames = data[? "f"];
		spd = data[? "s"];
		owneruID = data[? "id"];
	}
} else if (data[? "w"] == 2){ //search snake
	global.playerID[? data[? "id"]].shootTimer = global.playerID[? data[? "id"]].shootTimerMax;
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
		owneruID = data[? "id"];
	}
} else if (data[? "w"] == 3){ //airshooter
	global.playerID[? data[? "id"]].shootTimer = global.playerID[? data[? "id"]].shootTimerMax;
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
		owneruID = data[? "id"];
	}
} else if (data[? "w"] == 4){ //rushcoil
	global.playerID[? data[? "id"]].throwTimer = global.playerID[? data[? "id"]].throwTimerMax;
	with(instance_create_depth(data[? "x"], data[? "y"], 0, obj_remoterushcoil)){
		owneruID = data[? "id"];
		dir = data[? "dir"];
		//dir = data[? "dir"];
		weaponid = data[? "w"];
		//show_debug_message("Frames = " + string(data[? "f"]));
		//frames = data[? "f"];
		//spd = data[? "s"];
	}
} else if (data[? "w"] == 5){ //hyperbomb
	global.playerID[? data[? "id"]].throwTimer = global.playerID[? data[? "id"]].throwTimerMax;
	with(instance_create_depth(data[? "x"], data[? "y"], 0, obj_remotehyperbomb)){
		ds_map_add(global.bulletID,data[? "ids"],id);
		owneruID = data[? "id"];
		dir = data[? "dir"];
		weaponid = data[? "w"];
		frames = data[? "f"];
		spd = data[? "s"];
	}
} else if (data[? "w"] == 6){ //rushjet
	global.playerID[? data[? "id"]].throwTimer = global.playerID[? data[? "id"]].throwTimerMax;
	with(instance_create_depth(data[? "x"], data[? "y"], 0, obj_remoterushjet)){
		ds_map_add(global.bulletID,data[? "ids"],id);
		//show_debug_message("remote rushjet received");
		dir = data[? "dir"];
		owneruID = data[? "id"];
		//weaponid = data[? "w"];
		//show_debug_message("Frames = " + string(data[? "f"]));
		//frames = data[? "f"];
		//spd = data[? "s"];
	}
} else if (data[? "w"] == 7){ //time stopper
	global.playerID[? data[? "id"]].throwTimer = global.playerID[? data[? "id"]].throwTimerMax;
	with(instance_create_depth(data[? "x"], data[? "y"], 0, obj_remotetimestopper)){
		ds_map_add(global.bulletID,data[? "ids"],id);
		owneruID = data[? "id"];
		//dir = data[? "dir"];
		player = global.playerID[? data[? "id"]];
		global.playerID[? data[? "id"]].activeTimeStopper = true;
		//weaponid = data[? "w"];
		//show_debug_message("Frames = " + string(data[? "f"]));
		//frames = data[? "f"];
		//spd = data[? "s"];
	}
} else if(data[? "w"] == 8){ //rollingcutter
	global.playerID[? data[? "id"]].throwTimer = global.playerID[? data[? "id"]].throwTimerMax;
	with(instance_create_depth(data[? "x"], data[? "y"], 0, obj_remoterollingcutter)){
		ds_map_add(global.bulletID,data[? "ids"],id);
		owneruID = data[? "id"];
		dir = data[? "dir"];
		spd = data[? "s"];
		player = global.playerID[? data[? "id"]];
	}
}


/*
//show_debug_message("shooter is id: " + data[? "id"]);
if(instance_exists(global.playerID[? data[? "id"]])){
	global.playerID[? data[? "id"]].shootTimer = 15;
}
*/



//show_debug_message("shooter is id: " + data[? "id"]);
if(instance_exists(global.playerID[? data[? "id"]])){
	global.playerID[? data[? "id"]].shootTimer = 15;
} 

if(data[? "dir"] > 90 and data[? "dir"] < 270){
	global.playerID[? data[? "id"]].sideFacing = -1;
} else {
	global.playerID[? data[? "id"]].sideFacing = 1;
}