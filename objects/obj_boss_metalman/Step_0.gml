centerx = x;
centery = y-sprite_height/2+6;
if(!scr_inView()){
	visible = false;
} else {
	visible = true;
}


if(!scr_inZone()){
	with(obj_metalman_enemy_metalblade){
		scr_explodeSmall();
		instance_destroy();
	}
	instance_destroy();
}
scr_bossblink();
if(hp <= 0 and canDie){
	with(obj_metalman_enemy_metalblade){
		scr_explodeSmall();
		instance_destroy();
	}
	instance_destroy();
}
if(scr_freezeexit()) return;
if (place_meeting(x,y,obj_player))
	scr_hurt(damageC,0);
	
if(vspd >= 0 and place_meeting(x,y+1,obj_wall)){
	grounded = 1;
} else {
	grounded = 0;
}
	
if(state == "fall"){
	if(grounded == 1){
		state = "sleepIntro";
	}
} else if (state == "sleepIntro"){
	if(sleepIntroTimer > 0){
		sleepIntroTimer--;
	} else {
		sleepIntroTimer = sleepIntroTimerMax;
		state = "fallSquatEntry";
	}
} else if (state == "fallSquatEntry") {
	if(fallSquatTimer > 0){
		fallSquatTimer--;
	} else {
		fallSquatTimer=fallSquatTimerMax;
		state = "heal";
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
			state = "idle";
			global.player.canInput = true;
			ricochet = false;
			attack = 1;
		}
	}
} else if (state == "idle"){
	if(idleTimer > 0){
		idleTimer--;
	}
	if (idleTimer <= 0 or global.player.actKeyPress){
		idleTimer = idleTimerMax;
		state = "jump";
		switch(irandom(2)){
			case 0:
				vspd = jumpType0Vspd;
				break;
			case 1:
				vspd = jumpType1Vspd;
				break;
			case 2:
				vspd = jumpType2Vspd;
				break;
		}
		throwTimer = 0;
	}
	if(scr_distanceToPlayer() < jumpDistance){
		state = "jumpOver";
		vspd = jumpOverVspd;
		hspd = jumpOverHspd * sideFacing;
		sideFacing = -sideFacing;
		jumpOverThrow = false;
	}
} else if (state == "jump"){
	if(grounded){
		state = "idle";
	}
	if (vspd > 0){
		if(throwTimer > 0){
			throwTimer--;
		} else {
			throwTimer = throwTimerMax;
			state = "throw";
			throwStopVspd = true;
			returnstate = "jump";

		}
	}
} else if (state == "throw"){
	if(throwStopVspd){
		vspd = 0;
	}
	if(windupTimer > 0){
		windupTimer--;
	} else {
		windupTimer = windupTimerMax;
		state = "windup2";
		//spawn metalblade
		instance_create_depth(centerx,centery,depth+1,obj_metalman_enemy_metalblade);
		audio_play_sound(snd_metalblade,50,0);
	}
} else if (state == "windup2"){
	//vspd = 0;
	if(windup2Timer > 0){
		windup2Timer--;
	} else {
		windup2Timer = windup2TimerMax;
		state = returnstate;
	}
} else if (state == "jumpOver"){
	if(grounded){
		hspd = 0;
		state = "idle";
	}
	if(vspd > 0 and !jumpOverThrow){
		returnstate = state;
		throwStopVspd = false;
		state = "throw";
		jumpOverThrow = true;
	}
	
}

if(whiteBgEnabled){
	layer_set_visible(whitebg,false);
}
if(conveyorSwitchTimer > 0){
	conveyorSwitchTimer--;
} else {
	conveyorSwitchTimer = conveyorSwitchTimerMax;
	layer_set_visible(whitebg, true);
	whiteBgEnabled = true;
	if(instance_exists(movingFloor))
		movingFloor.sideFacing = -movingFloor.sideFacing;
}

//collisions
vspd += grav;
//grounded = 0;
wallCollide = false;
_wall = instance_place(x, y+vspd, obj_wall)
if (_wall != noone) {
	if(_wall.y > y){
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


	if(state == "fall" or state == "jump"){
		sprite_index = spr_boss_metalman_fall;
	} else if (state == "sleepIntro"){
		image_index = 0;
		sprite_index = spr_boss_metalman_taunt;
	} else if (state == "fallSquatEntry"){
		image_index = 1;
		sprite_index = spr_boss_metalman_taunt;
	} else if(state == "heal"){
		sprite_index = spr_boss_metalman_taunt;
		image_index = 2;
	} else if(state == "idle"){
		sprite_index = spr_boss_metalman_run;
	} else if (state == "throw"){
		sprite_index = spr_boss_metalman_throw;
		image_index = 0;
	} else if (state == "windup2"){
		sprite_index = spr_boss_metalman_throw;
		image_index = 1;
	}
	 
	image_xscale = -sideFacing;