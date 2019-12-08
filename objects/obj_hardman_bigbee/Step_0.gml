centerx = x;
centery = y;
with(hive){
	zone = other.zone;
}
//target = instance_nearest(x, y, obj_player);
if(!scr_inZoneAndView())
	instance_destroy();

if(hp<=0){
	scr_explodeSmall();
	scr_dropPickups(3);
	if(hasHive){
		if(instance_exists(hive))
			hive.fall = true;
	}
	instance_destroy();
}
if(scr_freezeexit()) return;

if(hasHive){
	with(hive){
		x = other.x;
		y = other.y;
	}
}
if(state == "fly"){
	hspd = spd * sideMoving;
	image_xscale = sideMoving;
	if(hasHive and ((sideMoving == 1 and x > global.player.x + dropDistance) or (sideMoving == -1 and x < global.player.x - dropDistance))){
		state = "readyToDrop";
		sinTimer = 0;
	} 
} else if (state == "readyToDrop"){
	image_xscale = -sideMoving;
	sinTimer++;
	hspd = 0;
	vspd = sin(sinTimer/10);
	if(RTDTimer > 0){
		RTDTimer--;
	} else {
		RTDTimer = RTDTimerMax;
		state = "drop";
		hasHive = false;
		with(hive){
			fall = true;
		}
	}
} else if(state == "drop"){
	vspd = 0;
	hspd = spd * sideMoving;
	image_xscale = sideMoving;
}


x += hspd;
y += vspd;

