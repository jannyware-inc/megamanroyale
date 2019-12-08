if(!stoppedTimer){
	stoppedTimer = true;
	if (global.player.timer != noone){
		global.player.timer.stop = true;
	}
}

timer++;
if(state == "teleport1"){
	image_index = 20;
	if(y + teleportSpd < global.player.y){
		y+=teleportSpd;
	} else {
		y = global.player.y;
		state = "teleport2";
	}
} else if(state == "teleport2"){
	image_index = 21;
	if(teleport2Timer > 0){
		teleport2Timer--;
	} else {
		state = "teleport3";
	}
} else if(state == "teleport3"){
	image_index = 22;
	if(teleport3Timer > 0){
		teleport3Timer--;
	} else {
		if (global.player.timer != noone){
			global.player.timer.stop = false;
		}
		instance_destroy();
	}
}