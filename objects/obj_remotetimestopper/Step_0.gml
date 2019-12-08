//send over network
if(player != noone and instance_exists(player)){
	y = player.centery;
	x = player.x;
} else {
	instance_destroy();
	return;
}

if(act == 1){ //za warudo
	act = 0;
	if(scr_inView()){
		scr_playNoOverlap(snd_za_warudo);
	}
}

if(rad < radMax and frames - (radMax/radInc)/2 >=0){
	
	rad+=radInc;
}
if(frames - (radMax/radInc)/2 < 0){
	rad -=radInc*2;
	if(rad < 0){
		rad = 0;
	}
}

if(frames > 0){
	frames--;
} else {
	instance_destroy();
	return;
}

if(sparkTimer > 0){
	sparkTimer--;
} else {
	sparkTimer = sparkTimerMax;
	for(i = 0; i < 1; i++){
		with(instance_create_depth(x-130+irandom(260),y-130+irandom(260),depth-100,obj_timestopperspark)){
			dir = point_direction(other.x,other.y,x,y);
		}
	}
}

/*
with(obj_enemy){
	if(!frozen){
		if(point_distance(centerx,centery,global.player.x,global.player.centery) < other.rad){
			frozen = true;
		} else {
			frozen = wasfrozen;
		}
	} else {
	
	}
}
with(obj_effect){
	if(point_distance(centerx,centery,global.player.x,global.player.centery) < other.rad){
		frozen = true;
	} else {
		frozen = wasfrozen;
	}
}
with(obj_pickup){
	if(point_distance(centerx,centery,global.player.x,global.player.centery) < other.rad){
		frozen = true;
	} else {
		frozen = wasfrozen;
	}
}
with(obj_snakeman_enemy_floatingplatform){
	if(point_distance(centerx,centery,global.player.x,global.player.centery) < other.rad){
		frozen = true;
	} else {
		frozen = wasfrozen;
	}
}
*/
