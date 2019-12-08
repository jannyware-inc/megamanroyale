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
	state = "getup";
 }
} else if (state == "getup"){
	ricochet = false;
	sideFacing = scr_playerSideCentered();
	if(getupTimer > 0){
		getupTimer--;
	} else {
		getupTimer = getupTimerMax;
		state = "idle";
		//spawn bullets
		for(i = 0; i < 3; i++){
			with(instance_create_depth(x,y-sprite_height/2,depth+1,obj_snakeman_enemy_projectile)){
				spd = 1.75;
				dir = 90 - (60*other.sideFacing) - (other.i*other.sideFacing*30);
			}
		}
		image_index = 0;
	}
} else if (state == "idle"){
	if(idleTimer > 0){
		idleTimer--;
	} else {
		idleTimer = idleTimerMax;
		state = "sleep";
	}
}

x+=hspd;
image_xscale = -sideFacing;

if (state == "idle"){
	sprite_index = spr_gutsman_metool_open;
} else if (state == "sleep"){
	sprite_index = spr_gutsman_metool_sleep;
} else if (state == "getup"){
	sprite_index = spr_gutsman_metool_open;
}