image_xscale = -sideFacing;
centerx = x+sideFacing*16;
centery = y;
if(scr_inView()){
	visible = true;
} else{
	visible = false;
	state = "idle";
	idleTimer = startIdleTimer;
	return;
}
if(!scr_inZone){
	state = "idle";
	idleTimer = startIdleTimer;
	return;
}

if(hp <= 0){
	scr_explodeSmall();
	scr_dropPickups(3);
	instance_destroy();
}

var freezeexit = false;
with(obj_timestopper){
	if(point_distance(x,y,other.centerx,other.centery) < rad){
		freezeexit = true;
	}
}
if(freezeexit){
	image_index -= sprite_get_speed(sprite_index)/60*image_speed;
	return;
}
with(obj_remotetimestopper){
	if(point_distance(x,y,other.centerx,other.centery) < rad){
		freezeexit = true;
	}
}
if(freezeexit){
	image_index -= sprite_get_speed(sprite_index)/60*image_speed;
	return;
}


if (place_meeting(x,y,obj_player))
	scr_hurt(damageC,0);
	
if(state == "idle"){
	ricochet = true;
	image_index = 0;
	image_speed = 0;
	if(!scr_inZone()){
		return;
	}
	if(scr_distanceToPlayer() < atkDistance){
		if(idleTimer > 0){
			idleTimer--;
		} else {
			idleTimer = idleTimerMax;
			state = "open";
		}
	} else {
		idleTimer = idleTimerMax;
	}
} else if (state == "open"){
	ricochet = false;
	image_speed = 1;
	if(openTimer > 0){
		openTimer--;
	} else {
		openTimer = openTimerMax;
		state = "attack";
	}
} else if (state == "attack"){
	image_speed = 0;
	image_index = 3;
	if(attackTimer > 0){
		attackTimer--;
	} else {
		attackTimer = attackTimerMax;
		if(shots > 0){
			with(instance_create_depth(x+16*sideFacing,y,depth+1,obj_cutman_enemy_sentryprojectile)){
				dir = 90-other.sideFacing*(45+((other.shotsMax-other.shots)*30));
			}
			scr_playNoOverlap(snd_sentryfire);
			shots--;
		} else {
			shots = shotsMax;
			state = "retreat"
			image_index = 3;
		}
	}
} else if(state == "retreat"){
	image_speed = -1;
	if(openTimer > 0){
		openTimer--;
	} else {
		openTimer = openTimerMax;
		state = "idle";
		image_index = 0;
		image_speed = 0;
	}
}
x+=hspd;
image_xscale = -sideFacing;