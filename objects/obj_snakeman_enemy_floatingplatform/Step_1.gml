centerx = x+sprite_width/2;
centery = y+sprite_height/2;

if(!scr_inZoneOrView()){

	instance_destroy();
	return;
}
if(scr_freezeexit()) return;

if(aliveTimer > 0){
	aliveTimer--;
} else {
	scr_explodeSmall();
	instance_destroy();
}


if(state == "rise"){
	if(!place_meeting(x,y,obj_wall)){
		state = "swayLeft";
		hspd = -swaySpd;
		vspd = riseSpd;
	} else {
		vspd = riseSpd;
		hspd = 0;
		swayTimer = swayTimerMax/2;
	}
} else if(state == "swayLeft"){
	if(swayTimer > 0){
		swayTimer--;
	} else {
		state = "swayRight";
		hspd = swaySpd;
		vspd = riseSpd;
		swayTimer = swayTimerMax;
	}
} else if (state == "swayRight"){
	if(swayTimer > 0){
		swayTimer--;
	} else {
		state = "swayLeft";
		hspd = -swaySpd;
		vspd = riseSpd;
		swayTimer = swayTimerMax;
	}
}

y+=vspd;
x+=hspd;

if(global.player.y <= y+3){
	mask_index = spr_snakeman_enemy_floatingplatform;
} else {
	mask_index = spr_mask_empty;
}

if(place_meeting(x,y-2.5,obj_player)){
	//global.player.y = y-1.5+2; //why +2? that's because the collision mask is two px lower than the y of the sprite!!!!
	_y = global.player.y;
	_x = global.player.x;
	
	global.player.y = y-1.5+2;
	global.player.externalhspd += hspd;
	_pCollide = false;
	with(global.player){
		_wallfp = instance_place(x,y+.4998,obj_wall);
		if(_wallfp != noone){
			other._pCollide = true;
		}
	}
	if(_pCollide){
		//global.player.x = _x;
		global.player.y = _y;
		mask_index = spr_mask_empty;
	} else {
		
	}
}