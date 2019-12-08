centerx = x;
centery = y;
if(scr_inView()){
	visible = true;
} else{
	visible = false;
}

if(scr_freezeexit()) return;

if(!scr_inZoneAndView()){
	scr_goHome();
	state = "wait";
	return;
}

if(hp <= 0){
	scr_explodeSmall();
	scr_dropPickups(3);
	instance_destroy();
}


if (place_meeting(x,y,obj_player))
	scr_hurt(damageC,0);

if(state == "wait"){

	y = ystart;
	if(scr_distanceToPlayer() < attackDistance)
		state = "fall";
} else if (state == "fall"){
	if(grounded){
		state = "waitfloor";
		//play sound
		audio_play_sound(snd_spikelantern,50,0);
		vspd = 0;
		
	} else {
		vspd += grav;
	}
} else if (state == "waitfloor"){
	vspd = 0;
	if(waitfloorTimer > 0){
		waitfloorTimer--;
	} else {
		waitfloorTimer = waitfloorTimerMax;
		state = "rise";
		
	}
} else if (state == "rise"){
	
	if(y <= ystart){
		state = "wait";
	} else {
		vspd = riseVspd;
	}
}

//collisions
grounded = 0;
if (place_meeting(x, y+vspd, obj_wall)) {
	_wall = instance_place(x,y+vspd,obj_wall)
	if(_wall.y > y)
		grounded = 1;
	else
		ceiled = 1;
			while(!place_meeting(x, y+(sign(vspd)*.99), obj_wall)) {
				y += (sign(vspd)*.99);
			}
		vspd = 0;
		
	}	
y+=vspd;
image_xscale = sideFacing;
if(instance_exists(wall)){
	with(wall){
		y = other.y-15;

		if(global.player.y <= y and other.state != "fall"){
			mask_index = spr_wall_0;
		} else {
			mask_index = spr_mask_empty;
		}
		if(place_meeting(x,y-2.5,global.player)){
			global.player.y = y-1.5;
			with(global.player){
				_wall = instance_place(x,y+.4998,obj_wall);
				if(_wall != noone and _wall != other.id){
					//kill player
					hp = 0;
				}
			}
		}
	}	
}