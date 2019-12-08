/// @desc shoot()
if(false){
	//out of ammo!
	//show_debug_message("no ammo");
	return;
}


if(weapon.name == "megabuster" and (weapon.infiniteAmmo or !weapon.ammoCur <= 0)){
	if(instance_number(obj_bullet) < 3){
		switch(face){
			case 0:
			case 1:
			case 7:
				with(instance_create_depth(x+armLength,y+armHeight,depth,obj_bullet)){
					spd = 6.5;
					dir = 0;
				}
				shootFrameTimer = shootFrames;
				break;
	
			case 3:	
			case 4:
			case 5:
				with(instance_create_depth(x-armLength,y+armHeight,depth,obj_bullet)){
					spd = 6.5;
					dir = 180;
				}
				shootFrameTimer = shootFrames;
				break;
		}
		if(audio_is_playing(snd_megabuster))
			audio_stop_sound(snd_megabuster);
		audio_play_sound(snd_megabuster,10,0);
	}
} else if(weapon.name == "metalblade" and (weapon.infiniteAmmo or !weapon.ammoCur <= 0)){
	if(instance_number(obj_bullet) < 3){
		if(!global.player.infiniteAmmo)
			weapon.ammoCur -= weapon.ammoUnit;
		throwTimer = throwTimerMax;
		shootFrameTimer = shootFrames;
		scr_get_shootface();
		//show_debug_message("face: " + string(shootface));
			with(instance_create_depth(x,y+armHeight,depth-1,obj_metalblade)){
					spd = 5;
					dir = other.shootface * 45;
			}
		if(audio_is_playing(snd_metalblade))
			audio_stop_sound(snd_metalblade);
		audio_play_sound(snd_metalblade,20,0);
	}
} else if(weapon.name == "searchsnake" and (weapon.infiniteAmmo or !weapon.ammoCur <= 0)){
	if(instance_number(obj_bullet) < 3){
		if(!global.player.infiniteAmmo)
			weapon.ammoCur -= weapon.ammoUnit;
		shootFrameTimer = shootFrames;
		switch(face){
			case 0:
			case 1:
			case 7:
				with(instance_create_depth(x+armLength,y+armHeight,depth,obj_searchsnake)){
					if(place_meeting(x,y,obj_wall))
						x = other.x;
					spd = 3;
					dir = 0;
					sideMoving = 1;
				}
				shootFrameTimer = shootFrames;
				break;
	
			case 3:	
			case 4:
			case 5:
				with(instance_create_depth(x-armLength,y+armHeight,depth,obj_searchsnake)){
					if(place_meeting(x,y,obj_wall))
						x = other.x;
					spd = 3;
					dir = 180;
					sideMoving = -1;
				}
				shootFrameTimer = shootFrames;
				break;
		}
		scr_playNoOverlap(snd_megabuster);
	}
} else if(weapon.name == "airshooter" and (weapon.infiniteAmmo or !weapon.ammoCur <= 0)){
	if(instance_number(obj_bullet) < 1){
		if(!global.player.infiniteAmmo)
			weapon.ammoCur -= weapon.ammoUnit;
		shootFrameTimer = shootFrames;
		switch(face){
			case 0:
			case 1:
			case 7:
				with(instance_create_depth(x+armLength+8,y+armHeight,depth,obj_airshooterspawner)){
					sideFacing = 1;
					dir = 0;
				}
				shootFrameTimer = shootFrames;
				break;
	
			case 3:	
			case 4:
			case 5:
				with(instance_create_depth(x-armLength-8,y+armHeight,depth,obj_airshooterspawner)){
					sideFacing = -1;
					dir = 180;
				}
				shootFrameTimer = shootFrames;
				break;
		}
		if(audio_is_playing(snd_airshooter))
			audio_stop_sound(snd_airshooter);
		audio_play_sound(snd_airshooter,20,0);
	}
} else if(weapon.name == "rushcoil"){
	var buster = true;
	if(instance_number(obj_rush) < 1 and (weapon.infiniteAmmo or !weapon.ammoCur <= 0)){
		buster = false;
		if(!global.player.infiniteAmmo)
			weapon.ammoCur -= weapon.ammoUnit;
		throwTimer = throwTimerMax;
		shootFrameTimer = shootFrames;
		switch(face){
			case 0:
			case 1:
			case 7:
				with(instance_create_depth(x+armLength,y+armHeight,depth-1,obj_rushcoil)){
					if(place_meeting(x,y,obj_wall))
						x = other.x;
					image_xscale = 1;
					dir = 0;
				}
				break;
	
			case 3:	
			case 4:
			case 5:
				with(instance_create_depth(x-armLength,y+armHeight,depth-1,obj_rushcoil)){
					if(place_meeting(x,y,obj_wall))
						x = other.x;
					image_xscale = -1;
					dir = 180
				}
				break;
		}
			
		if(audio_is_playing(snd_metalblade))
			audio_stop_sound(snd_metalblade);
		audio_play_sound(snd_metalblade,20,0);
	} else if(instance_number(obj_rushcoil) > 0 and (weapon.infiniteAmmo or !weapon.ammoCur <= 0)){	
		if(!global.player.infiniteAmmo)
			weapon.ammoCur -= weapon.jetUnit; 
		with(obj_rushcoil){
			if(!grounded){
				buster = false;
				state = "converttojet";
			}
		}
	}
	if(buster and instance_number(obj_bullet) < 3){
		switch(face){
			case 0:
			case 1:
			case 7:
				with(instance_create_depth(x+armLength,y+armHeight,depth,obj_bullet)){
					spd = 5;
					dir = 0;
				}
				shootFrameTimer = shootFrames;
				break;
	
			case 3:	
			case 4:
			case 5:
				with(instance_create_depth(x-armLength,y+armHeight,depth,obj_bullet)){
					spd = 5;
					dir = 180;
				}
				shootFrameTimer = shootFrames;
				break;
		}
		scr_playNoOverlap(snd_megabuster);
	}
} else if(weapon.name == "hyperbomb" and (weapon.infiniteAmmo or !weapon.ammoCur <= 0)){
	if(instance_number(obj_bullet) < 2){
		if(!global.player.infiniteAmmo)
			weapon.ammoCur -= weapon.ammoUnit;
		throwTimer = throwTimerMax;
		shootFrameTimer = shootFrames;
		scr_get_shootface();

		//show_debug_message("face: " + string(shootface));
			with(instance_create_depth(x,y+armHeight,depth-1,obj_hyperbomb)){
				if(other.shootface == 0){
					dir = 15;
					if(other.rKey){
						spd = spdFast;
					} else {
						spd = spdSlow;
					}
				} else if(other.shootface == 1 or (other.shootface == 2 and (other.face == 7 or other.face == 0 or other.face == 1))){
					dir = 65;
					if(other.rKey){
						spd = spdFast;
					} else {
						spd = spdSlow;
					}
				} else if(other.shootface == 3 or (other.shootface == 2 and (other.face == 3 or other.face == 4 or other.face == 5))){
					dir = 180-65;
					if(other.lKey){
						spd = spdFast;
					} else {
						spd = spdSlow;
					}
				} else if (other.shootface == 4){
					dir = 180-15;
					if(other.lKey){
						spd = spdFast;
					} else {
						spd = spdSlow;
					}
				} else if (other.shootface == 5 or other.shootface == 6 or other.shootface == 7){
					if(other.grounded){
						frames = 18;
					}
					spd = spdSlow;
					dir = 270;
				}
			}
		scr_playNoOverlap(snd_rushbounce);
	}
} else if(weapon.name == "rushjet" and (weapon.infiniteAmmo or !weapon.ammoCur <= 0)){
	if(instance_number(obj_rush) < 1){
		if(!global.player.infiniteAmmo)
			weapon.ammoCur -= weapon.ammoUnit;
		throwTimer = throwTimerMax;
		shootFrameTimer = shootFrames;
		switch(face){
			case 0:
			case 1:
			case 7:
				with(instance_create_depth(x+armLength-(uKey*4),y+armHeight+(uKey*6),depth+2,obj_rushjet)){
					//if(place_meeting(x,y,obj_wall))
						//x = other.x;
					dir = 0;
				}
				break;
	
			case 3:	
			case 4:
			case 5:
				with(instance_create_depth(x-armLength+(uKey*4),y+armHeight+(uKey*6),depth+2,obj_rushjet)){
					//if(place_meeting(x,y,obj_wall))
						//x = other.x;
					dir = 180
				}
				break;
		}
			
		scr_playNoOverlap(snd_metalblade);

	}else if(instance_number(obj_bullet) < 3){
		switch(face){
			case 0:
			case 1:
			case 7:
				with(instance_create_depth(x+armLength,y+armHeight,depth,obj_bullet)){
					spd = 5;
					dir = 0;
				}
				shootFrameTimer = shootFrames;
				break;
	
			case 3:	
			case 4:
			case 5:
				with(instance_create_depth(x-armLength,y+armHeight,depth,obj_bullet)){
					spd = 5;
					dir = 180;
				}
				shootFrameTimer = shootFrames;
				break;
		}
		scr_playNoOverlap(snd_megabuster);
	}
} else if(weapon.name == "timestopper"){
	if(instance_number(obj_timestopper) < 1 and (weapon.infiniteAmmo or weapon.ammoCur - weapon.ammoUnit >= 0) and (!(weapon.infiniteAmmo or infiniteAmmo) or timeStopperCooldown <= 0)){
		if(!global.player.infiniteAmmo)
			weapon.ammoCur -= weapon.ammoUnit;
		throwTimer = throwTimerMax;
		shootFrameTimer = shootFrames;
		timeStopperCooldown = timeStopperCooldownMax;
		switch(face){
			case 0:
			case 1:
			case 7:
				with(instance_create_depth(x,y,depth+2,obj_timestopper)){
					dir = 0;
				}
				break;
	
			case 3:	
			case 4:
			case 5:
				with(instance_create_depth(x,y,depth+2,obj_timestopper)){
					dir = 180;
				}
				break;
		}
	
		scr_playNoOverlap(snd_spikelantern);

	} else if(instance_number(obj_bullet) < 3 and !remotetimestopperfrozen){
		switch(face){
			case 0:
			case 1:
			case 7:
				with(instance_create_depth(x+armLength,y+armHeight,depth,obj_bullet)){
					spd = 5;
					dir = 0;
				}
				shootFrameTimer = shootFrames;
				break;
	
			case 3:	
			case 4:
			case 5:
				with(instance_create_depth(x-armLength,y+armHeight,depth,obj_bullet)){
					spd = 5;
					dir = 180;
				}
				shootFrameTimer = shootFrames;
				break;
		}
		scr_playNoOverlap(snd_megabuster);
	}
} if(weapon.name == "rollingcutter" and (weapon.infiniteAmmo or !weapon.ammoCur <= 0)){
	if(instance_number(obj_bullet) < 1){
		if(!global.player.infiniteAmmo)
			weapon.ammoCur -= weapon.ammoUnit;
		throwTimer = throwTimerMax;
		switch(face){
			case 0:
			case 1:
			case 7:
				with(instance_create_depth(x+armLength,y+armHeight,depth,obj_rollingcutter)){
					spd = 2.8;
					if(other.uKey){
						dir = 50;
					} else if(other.dKey){
						dir = 340;
					} else {
						dir = 0;
					}
				}
				break;
	
			case 3:	
			case 4:
			case 5:
				with(instance_create_depth(x-armLength,y+armHeight,depth,obj_rollingcutter)){
					spd = 2.8;
					if(other.uKey){
						dir = 130;
					} else if(other.dKey){
						dir = 200;
					} else {
						dir = 180;
					}
				}
				break;
		}
	}
}





if(weapon.ammoCur < 0)
	weapon.ammoCur = 0;