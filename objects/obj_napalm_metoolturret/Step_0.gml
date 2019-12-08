centerx = x;
centery = y-sprite_height/2;
if(scr_inView()){
	visible = true;
} else{
	visible = false;
}

if(!scr_inZoneOrView()){
	scr_goHome();
	state = "sleep";
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

if(state == "sleep"){
	ricochet = true;
	hspd = 0;
	if (sleepTimer > 0){
		if(scr_distanceToPlayer() < attackDistance and abs(y - global.player.y) < attackY)
			sleepTimer--;
	else
		sleepTimer = sleepTimerMax;
 } else {
	sleepTimer = sleepTimerMax;
	state = "wakeup";
	image_index = 0;
 }
} else if (state == "wakeup"){
	if(image_index > 1){
		image_index = 1;
	}
	ricochet = false;
	if(wakeupTimer > 0){
		wakeupTimer--;
	} else {
		wakeupTimer = wakeupTimerMax;
		if(sideFacing != scr_playerSideCentered()){
			state = "turn";
		} else {
			image_index = 0;
			state = "shoot";
			//spawn bullets
			with(instance_create_depth(x,centery+4,depth+1,obj_napalm_metoolturretbullet)){
				dir = 90 + -90*other.sideFacing;
			}
		}
		image_index = 0;
	}
} else if (state == "shoot"){
	if (shootTimer > 0){
		shootTimer--;
	} else {
		shootTimer = shootTimerMax;
		state = "sleep";
	}
} else if (state == "idle"){
	if(idleTimer > 0){
		idleTimer--;
	} else {
		idleTimer = idleTimerMax;
		state = "sleep";
	}
} else if (state == "turn"){
	if(turnTimer == floor(turnTimerMax /2)+1){
		sideFacing = -sideFacing;
	}
	if(turnTimer > 0){
		turnTimer--;
	} else {
		turnTimer = turnTimerMax;
		state = "sleep";
	}
}

x+=hspd;
image_xscale = -sideFacing;

if (state == "sleep"){
	sprite_index = spr_napalm_metoolturret_sleep;
} else if (state == "shoot"){
	sprite_index = spr_napalm_metoolturret_shoot;
} else if (state == "wakeup"){
	sprite_index = spr_napalm_metoolturret_wakeup;
} else if (state == "turn"){
	sprite_index = spr_napalm_metoolturret_turn;
	image_index = min(turnTimer/(turnTimerMax/4),(turnTimerMax-turnTimer)/(turnTimerMax/4),1.99);
}