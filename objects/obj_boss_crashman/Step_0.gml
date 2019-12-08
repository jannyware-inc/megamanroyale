get_input();
centerx = x;
centery = y-sprite_height/2;
if(!scr_inView()){
	visible = false;
} else {
	visible = true;
}
	

if(!scr_inZone()){
	with(obj_boss_crashman_crashbomber){
		instance_destroy();
	}
	instance_destroy();
	return;
}
scr_bossblink();
if(hp <= 0 and canDie){
	with(obj_boss_crashman_crashbomber){
		instance_destroy();
	}
	instance_destroy();
	return;
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
			state = "run";
			global.player.canInput = true;
			ricochet = false;
		}
	}
} else if (state == "run"){
	if(hp < hpMax){
		attackTimer--;
	}
	hspd = runSpd * sideFacing;
	if((hspd < 0 and x < leftBarrier) or (hspd > 0 and x > rightBarrier)){
		sideFacing = -sideFacing;
	}
	if(actKeyPress or attackTimer <= 0){
		attackTimer = attackTimerMax;
		state = "jumpAttack";
		vspd = jumpVspd;
		sideFacing = scr_playerSideCentered();
		hspd = sideFacing * min(jumpHspdMax,jumpHspd*scr_xDistanceToPlayerCentered());
	}
} else if(state == "jumpAttack"){
	sideFacing = scr_playerSideCentered();
	if(vspd > 0){
		state = "jumpShoot";
		//spawn crash bomb
		instance_create_depth(x,y-6,depth-1,obj_boss_crashman_crashbomber);
		image_index = .75;
	}
} else if(state == "jumpShoot"){
	sideFacing = scr_playerSideCentered();
	if(grounded){
		state = "run";
	}
	/*
	if(jumpShootTimer > 0){
		jumpShootTimer--;
	} else {
		jumpShootTimer = jumpShootTimerMax;
		stat
	}
	*/
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


	if(state == "fall" or state == "jumpAttack"){
		sprite_index = spr_boss_crashman_jump;
		image_index = 0;
	} else if (state == "sleepIntro"){
		sprite_index = spr_boss_crashman_taunt;
		image_index = 0;
	} else if(state == "heal"){
		sprite_index = spr_boss_crashman_taunt;
		if(image_index > 2){
			image_index = 2;
		}
	} else if (state == "run"){
		sprite_index = spr_boss_crashman_run;
	} else if(state == "jumpShoot"){
		sprite_index = spr_boss_crashman_shoot;
		if(image_index > 2){
			image_index = 2;
		}
	} 
	 
	image_xscale = -sideFacing;