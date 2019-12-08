//target = instance_nearest(x, y, obj_player);
if(!scr_inZoneOrView())
	instance_destroy();

if(scr_freezeexit()) return;

if(aliveFrames > 0){
	if (place_meeting(x,y,global.player))
			scr_hurt(damageC,0);
	aliveFrames--;
} else {
	instance_destroy();
}

if(state == "right"){
	if(sideTimer > 0){
		sideTimer--;
		x += hspd;
		y += vspd;
	} else {
		image_index = 6; 
		state = "left";
		sideTimer = sideTimerMax;
	}
} else if(state == "left"){
	if(sideTimer > 0){
		sideTimer--;
		x -= hspd;
		y += vspd;
	} else {
		image_index = 2;
		state = "right";
		sideTimer = sideTimerMax;
	}
}