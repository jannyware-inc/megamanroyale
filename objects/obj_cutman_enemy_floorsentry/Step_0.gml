centerx = x;
centery = y-sprite_height/2;
if(scr_inView()){
	visible = true;
} else{
	visible = false;
	state = "idle";
	idleTimer = startIdleTimer;
	return;
}

scr_hurtblink();
if(hp <= 0){
	scr_explodeSmall();
	scr_dropPickups(2);
	instance_destroy();
}

if(scr_freezeexit()) return;

if (place_meeting(x,y,obj_player))
	scr_hurt(damageC,0);
	
if(state == "idle"){
	sprite_index = spr_cutman_enemy_floorsentry;
	image_index = 0;
	image_speed = 0;
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
	sprite_index = spr_cutman_enemy_floorsentry;
	image_index = 1;
	if(openTimer > 0){
		openTimer--;
	} else {
		openTimer = openTimerMax;
		state = "attack";
	}
} else if (state == "attack"){
	sprite_index = spr_cutman_enemy_floorsentryspin;
	image_speed = 1;
	if(attackTimer > 0){
		attackTimer--;
	} else {
		attackTimer = attackTimerMax;
		if(shots > 0){
			scr_playNoOverlap(snd_sentryfire);
			for(i = 0; i <= 180; i+=45){
				with(instance_create_depth(centerx,centery-6,depth+1,obj_cutman_enemy_flyingmetoolprojectile)){
					dir = other.i;
				}
			}
			shots--;
		} else {
			shots = shotsMax;
			state = "retreat";
			image_index = 1;
		}
	}
} else if(state == "retreat"){
	sprite_index = spr_cutman_enemy_floorsentry;
	image_index = 1;
	if(openTimer > 0){
		openTimer--;
	} else {
		openTimer = openTimerMax;
		state = "idle";
	}
}
x+=hspd;
image_xscale = -sideFacing;