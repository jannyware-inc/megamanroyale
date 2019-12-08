centerx = x;
centery = y-sprite_height/2;
if(scr_inZoneOrView()){

} else{
	visible = false;
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
	
if(state == "wait"){
	isShootable = false;
	y = homeY;
	visible = false;
	vspd = 0;
	if(scr_xDistanceToPlayerCentered() < atkDistance and (global.player.y < y and global.player.y > y+atkYDistance)){
		state = "preattack";
	}
}else if (state == "preattack"){
	if(waitTimer > 0){
		waitTimer--;
	} else {
		waitTimer = waitTimerMax;	
		state = "attack";
	}
} else if (state == "attack"){
	isShootable = true;
	visible = true;
	if(y > atky){
		y+=atkVspd;
	} else {
		state = "retreat";
		//scr_playNoOverlap(snd_trap);
	}

} else if(state == "retreat"){
	visible = true;
	if(y < homeY){
		y += retreatVspd;
	} else {
		y = homeY;
		state = "wait";
	}
}

if(state == "attack"){
	sprite_index = spr_napalm_torpedo_attack;
} else if (state == "retreat"){
	sprite_index = spr_napalm_torpedo_retreat;
}