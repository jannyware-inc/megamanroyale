centerx = x+sprite_width/2;
centery = y+sprite_height/2;
if(!scr_inView()){
	visible = false;
} else {
	visible = true;
}
	

if(!scr_inZoneAndView()){
	state = "wait";
	return;
}



scr_hurtblink();
if(hp<=0){
	scr_dropPickups(5);
	scr_explodeSmall();
	instance_destroy();
}
if(scr_freezeexit()) return;

if (place_meeting(x,y,obj_player))
	scr_hurt(damageC,0);

if(state == "wait"){
	if(scr_distanceToPlayer() < atkDist){
		if(spawnTimer > 0){
			spawnTimer--;
		} else {
			if(instance_number(obj_airman_enemy_shit) < maxShit){
				spawnTimer = spawnTimerMax;
				state = "attack";
			}
		}
	} else {
		spawnTimer = spawnTimerMax;
	}
} else if (state == "attack"){
	if(attackTimer > 0){
		attackTimer--;
	} else {
		attackTimer = attackTimerMax;
		instance_create_depth(x+sprite_width/2+deployOffsetX, y+deployOffsetY, depth-1, obj_airman_enemy_shit);
		state = "wait";
	}
}

if(state == "wait"){
	sprite_index = spr_airman_enemy_shitfunnel_sleep;
} else if (state == "attack") {
	sprite_index = spr_airman_enemy_shitfunnel_deploy;
}