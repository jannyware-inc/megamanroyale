centerx = x+sprite_width/2;
centery = y+sprite_height/2;
if(!scr_inView()){
	visible = false;
} else {
	visible = true;
}

if(scr_freezeexit()) return;

if(scr_distanceToPlayer() > 300){
	return;
}
if(!scr_inZoneAndView()){
	state = "sleep";
	return;
}

scr_hurtblink();

if(hp<= 0){
	scr_explodeSmall();
	scr_dropPickups(10);
	instance_destroy();
}
	
if (place_meeting(x,y,obj_player))
	scr_hurt(damageC,0);
	
if(state != "sleep"){
	if(abs(global.player.x - (x+sprite_width/2)) >= atkDist){
		state = "sleep";
	}
}
	
if(state == "sleep"){
	if(abs(global.player.x - (x+sprite_width/2)) < atkDist){
		state = "charge";
	}
} else if (state == "charge"){
	if(global.player.centerx < x+sprite_width)
		global.player.externalhspd -= blowForce;
	if(chargeTimer > 0){
		chargeTimer--;
	} else {
		chargeTimer = chargeTimerMax;
		state = "blow";
	}
} else if (state == "blow"){
	if(global.player.centerx < x+sprite_width)
		global.player.externalhspd -= blowForce;
	if(blowTimer > 0){
		blowTimer--;
	} else {
		blowTimer = blowTimerMax;
		state = "charge";
	}
}


if(state == "sleep"){
	sprite_index = spr_airman_enemy_fatmegaman_blow;
	image_index = 0;
} else if (state == "blow"){
	sprite_index = spr_airman_enemy_fatmegaman_blow;
} else if (state == "charge"){
	sprite_index = spr_airman_enemy_fatmegaman_charge;
}
