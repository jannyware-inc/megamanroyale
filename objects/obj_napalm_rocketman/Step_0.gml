centerx = x;
centery = y-sprite_height/2;
if(scr_inView()){
	visible = true;
} else{
	visible = false;
}

if(!scr_inZoneOrView()){
	scr_goHome();
	state = "idle";
	return;
}

if(hp <= 0){
	scr_explodeSmall();
	scr_dropPickups(3);
	instance_destroy();
}
if(scr_freezeexit()) return;

if (place_meeting(x,y,obj_player))
	scr_hurt(damageC,0);

if(state == "idle"){
	if(scr_xDistanceToPlayerCentered() < atkDist and instance_number(obj_napalm_rm_rocket) <= 0){
		if(idleTimer > 0 ){
			idleTimer--;
		} else {
			state = "open";
			idleTimer = idleTimerMax;
		}
	} else {
		idleTimer = idleTimerMax;
	}
} else if (state == "open"){
	if(openTimer > 0){
		openTimer--;
	} else {
		openTimer = openTimerMax;
		state = "attack";
		//spawn rocket
		with(instance_create_depth(x+shootOffsetX*sideFacing,y+shootOffsetY,depth-1,obj_napalm_rm_rocket)){
			zone = other.zone;
		}
		rockets--;
	}
} else if(state == "attack"){
	if(attackTimer > 0){
		attackTimer--;
	} else {
		attackTimer = attackTimerMax;
		if(rockets > 0){
			rockets--;
			with(instance_create_depth(x+shootOffsetX*sideFacing,y+shootOffsetY,depth-1,obj_napalm_rm_rocket)){
				zone = other.zone;
			}
		} else {
			rockets = rocketsMax;
			state = "idle";
		}
	}
}

if(state == "idle"){
	sprite_index = spr_napalm_rocketman_idle;
} else if (state == "open"){
	sprite_index = spr_napalm_rocketman_open;
	image_index = (1 - (openTimer/openTimerMax)) * 5;
} else if (state == "attack"){
	if(attackTimer > attackTimerMax * .5){
		sprite_index = spr_napalm_rocketman_attack;
		image_index = 0;
	} else {
		sprite_index = spr_napalm_rocketman_open;
		image_index = 0;
	}
}