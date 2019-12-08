centerx = x;
centery = y-sprite_height/2;
if(!scr_inView()){
	visible = false;
} else {
	visible = true;
}

if(instance_exists(cutmanhatmagnet)){
	cutmanhatmagnet.x= centerx;
	cutmanhatmagnet.y = centery;
	if(!hasHat and instance_exists(cutmanhat)){
		with(cutmanhatmagnet){
			_hat = instance_place(x,y,other.cutmanhat);
			if(_hat != noone and _hat.state == "return"){
				instance_destroy(_hat);
				other.hasHat = true;
				audio_stop_sound(snd_cutmanhat);
			}
		}
	}
}

if(!scr_inZone()){
	audio_stop_sound(snd_cutmanhat);
	with(obj_boss_cutmanhat){
		instance_destroy();
	}
	instance_destroy();
}
if(hurt and canDie){
	sideFacing = scr_playerSideCentered();
	state = "hurt";
}
scr_bossblink();
if(hp <= 0 and canDie){
	with(obj_boss_cutmanhat){
		instance_destroy();
	}
	with(obj_boss_cutmanhatmagnet){
		instance_destroy();
	}
	audio_stop_sound(snd_cutmanhat);
	instance_destroy();
	return;
}
if(scr_freezeexit()) return;
if (place_meeting(x,y,obj_player))
	scr_hurt(damageC,0);

	
if(state == "fall"){
	if(grounded == 1){
		state = "heal";
		scr_playNoOverlap(snd_cutmantaunt);
	}
} else if (state == "heal") {
	if(hpTimer > 0){
		hpTimer--;
	} else {
		hpTimer = hpTimerMax;
		if (hp < hpMax){
			hp++;
			scr_playNoOverlap(snd_heal1hp);
		} else {
			canDie = true;
			state = "run";
			global.player.canInput = true;
			ricochet = false;
			attack = 1;
		}
	}
} else if (state == "run"){
	if(runTimer > 0){
		runTimer--;
	}
	if(wallCollide or scr_xDistanceToPlayerCentered() < minRunDistance or runTimer <= 0){
		runTimer = RUNTIMERMAX;
		if(irandom(5) < 4 or !hasHat){
			state = "jump";
			vspd = jumpVspd;
			if(irandom(2)==0){
				jumps = 1+irandom(1);
			} else {
				jumps = 1+irandom(3);
			}
			sideFacing = scr_playerSideCentered();
			if(scr_xDistanceToPlayerCentered() < fastJumpDistance){
				if(irandom(5)<4) {
					currentJumpHSpd = slowJumpHspd;
				} else {
					currentJumpHspd = verySlowJumpHspd;
				}
			} else {
				currentJumpHSpd = fastJumpHspd;
			}	
		} else {
			//play taunt sound here
			hspd = 0;
			state = "tauntThrow";
			image_index = 0;
			scr_playNoOverlap(snd_cutmantaunt);
		}
	} else { 
		//show_debug_message(string(scr_distanceToPlayer()));
		sideFacing = scr_playerSideCentered();
		//show_debug_message(string(sideFacing));
		hspd = runSpd * sideFacing;
	}
} else if (state == "jump"){
	if(grounded){
		if(jumps > 0){
			vspd = jumpVspd;
			jumps--;
			sideFacing = scr_playerSideCentered();
			if(scr_xDistanceToPlayerCentered() < fastJumpDistance){
				if(irandom(5)<4){
					currentJumpHSpd = slowJumpHspd;
				} else {
					currentJumpHspd = verySlowJumpHspd;
				}
			} else {
				currentJumpHSpd = fastJumpHspd;
			}	
		} else {
			if(irandom(2)==0){
				state = "taunt";
				hspd = 0;
			} else {
				state = "run";
			}
		}
	} else {
		hspd = sideFacing * currentJumpHSpd;
	}
} else if (state == "throw"){
	if(grounded){
		hspd = 0;
	}
	
	if(windupTimer > 0){
		windupTimer--;
	} else {
		windupTimer = windupTimerMax;
		state = "windup2";
		//spawn metalblade
		cutmanhat = instance_create_depth(centerx,centery,depth+1,obj_boss_cutmanhat);
		audio_play_sound(snd_metalblade,50,0);
		hasHat = 0;
	}
} else if (state == "windup2"){
	if(grounded){
		hspd = 0;
	}
	
	if(windup2Timer > 0){
		windup2Timer--;
	} else {
		windup2Timer = windup2TimerMax;
		state = returnstate;
	}
} else if (state == "tauntThrow"){
	hspd = 0;
	if(tauntThrowTimer > 0){
		tauntThrowTimer--;
	} else {
		tauntThrowTimer = tauntThrowTimerMax;
		state = "throw";
		returnstate = "run";
		if(irandom(2) == 0){
			runTimer = 0;
		}
	}
} else if (state == "taunt"){
	if(tauntTimer > 0){
		tauntTimer--;
	} else {
		tauntTimer=TAUNTTIMERMAX;
		state = "run";
		image_index = 0;
	}
} else if(state == "hurt"){
	hspd = sideFacing*hurtVspd;
	if(hurtTimer1 > 0){
			vspd = 0;
		hurtTimer1--;
	} else {
		if(grounded){
			hurtTimer1 = hurtTimer1Max;
			state = "run";
			image_index = 0;
		}
	}	
}

if(hasHat and state != "tauntThrow" and (state == "run" or state == "jump")){
	if(timedThrowTimer > 0){
		timedThrowTimer--;
	} else {
		returnstate = state;
		state = "throw";
	}
} else {
	timedThrowTimer = TIMEDTHROWTIMERMAX;
}


grounded = 0;
//collisions
if(!(state == "hurt" and hurtTimer1 > 0))
	vspd += grav;
//grounded = 0;
wallCollide = false;
_wall = instance_place(x, y+vspd, obj_wall)
if (_wall != noone) {
	if(_wall.y > y){
		grounded = 1;
		while(!place_meeting(x, y+(sign(vspd)*.99), obj_wall)) {
			y += (sign(vspd)*.99);
		}
			vspd = 0;
		}
	}	
y+=vspd;

if (place_meeting(x+hspd, y, obj_wall)) {
	wallCollide = true;
	while(!place_meeting(x+(sign(hspd)*.99), y, obj_wall)) {
		x += (sign(hspd)*.99);
	}
	hspd = 0;
	}	
x+=hspd;


//image_xscale = -sideFacing;


if(state == "fall"){
	image_index = 0;
	if(hasHat)
		sprite_index = spr_boss_cutmantaunt;
	else
		sprite_index = spr_boss_cutmantauntnohat
} else if (state == "taunt"){
	if(hasHat)
		sprite_index = spr_boss_cutmantaunt;
	else
		sprite_index = spr_boss_cutmantauntnohat
}else if (state == "jump"){
	if(hasHat)
		sprite_index = spr_boss_cutmanjump;
	else 
		sprite_index = spr_boss_cutmanjumpnohat;
} else if (state == "tauntThrow"){
	sprite_index = spr_boss_cutmantaunt;
} else if(state == "heal"){
	sprite_index = spr_boss_cutmantaunt;
} else if(state == "run"){
	if(hasHat)
		sprite_index = spr_boss_cutmanrun;
	else
		sprite_index = spr_boss_cutmanrunnohat;
} else if (state == "throw"){
	sprite_index = spr_boss_cutmanthrow;
	image_index = 0;
} else if (state == "windup2"){
	sprite_index = spr_boss_cutmanthrow;
	image_index = 1;
} else if (state == "hurt"){
	image_index = 1;
	if(hasHat)
		sprite_index = spr_boss_cutmanrun;
	else
		sprite_index = spr_boss_cutmanrunnohat;
}
if(!(state == "hurt" and hurtTimer1 > 0))
	image_xscale = -scr_playerSideCentered();