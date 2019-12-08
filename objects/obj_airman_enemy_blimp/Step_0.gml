if(!scr_inZoneAndView()){
	state = "wait";
	instance_destroy(horn1);
	instance_destroy(horn2);
	draw = false;
	isShootable = false;
	return;
}

if(scr_freezeexit()) return;	


if(state == "wait"){
	draw = false;
	if(abs(global.player.x - (x+sprite_width/2)) < fadeInDist){
		draw = true;
		state = "fadeIn";
	}
} else if(state == "fadeIn"){	
	draw = true;
	if(fadeInTimer > 0){
		fadeInTimer--;
	} else {
		fadeInTimer = fadeInTimerMax;
		state = "blink";
		isShootable = true;
		horn1 = instance_create_depth(x+4,y,400,obj_airman_enemy_horn);
		with(horn1){
			zone = other.zone;
		}
		horn2 = instance_create_depth(x,y,400,obj_airman_enemy_horn);
		with(horn2){
			zone = other.zone;
			x = other.x+other.sprite_width-sprite_width-4;
		}
	}
} else if(state == "blink"){
	draw = true;
	if(global.player.y < y + sprite_height and (global.player.x+global.playerWidth)>x and global.player.x < x+sprite_width and (!instance_exists(flaotyboys[0]) or !instance_exists(flaotyboys[1]) or !instance_exists(flaotyboys[2]) )){
		spawnTimer--;
	} else {
		spawnTimer = spawnTimerMax;
	}
	if(spawnTimer < 0){
		spawnTimer = spawnTimerMax;
		for(i=0;i<3;i++){
			if(!instance_exists(flaotyboys[i])){
				spawnIndex++;
				if(spawnIndex%2 == 0){
					flaotyboys[i] = instance_create_depth(x,y+deployOffsetY,400,obj_airman_enemy_flaotyboy);//left
					with(flaotyboys[i]){
						deploySpd = -deploySpd;
					}
					return;
				} else {
					flaotyboys[i] = instance_create_depth(x+sprite_width-16,y+deployOffsetY,400,obj_airman_enemy_flaotyboy);//left
					with(flaotyboys[i]){
						deploySpd = deploySpd;
					}
					return;
				}
			}
		}
	}
}

if(state == "fadeIn"){
	sprite_index = spr_airman_enemy_blimp_fade;
} else if (state == "blink" or state == "spawnHorns"){
	sprite_index = spr_airman_enemy_blimp_blink;
}

if(!scr_inView()){
	visible = false;
} else {
	visible = draw;
}