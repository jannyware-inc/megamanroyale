centerx = x+sprite_width/2;
centery = y+sprite_height/2;
if(!scr_inView()){
	visible = false;
} else {
	visible = true;
}

if(!scr_inZoneAndView())
	return;

scr_hurtblink();

if(hp <= 0){
	scr_explodeBig();
	instance_destroy(wall1);
	scr_dropPickups(15);
	instance_destroy();
}
if(scr_freezeexit()) return;

if (place_meeting(x,y,global.player))
	scr_hurt(damageC,0);

//player distance checking
if(scr_distanceToPlayer() < aRad and player.y > y-60 or state == "attack"){
	stopAnimations = false;
	if(state == "sleep"){
		if(sleepTimer > 0){
			sleepTimer--;
		}else{
			state = "paw";
			sleepTimer = sleepTimerMax;
		}
	}
	else if(state == "paw"){
		if(pawTimer > 0){
			pawTimer--;
		}else{
			state = "attack";
			pawTimer = pawTimerMax;
			fireballs = 4 + random(fireballRandom);
		}
	} else if (state == "attack"){
		if(fireballTimer > 0){
			fireballTimer--;
		}else{
			fireballTimer = fireballTimerMax;
			if(fireballs > 0){
				fireballs--;
				curFireball = instance_create_depth(x+fireballOffsetX,y+fireballOffsetY,100,obj_fireball)
				with(curFireball){
					image_index = other.fireballs%2;
					hspd = -3.5;
					vspd = 4.5;
					grav = -.3;
				}
			} else {
				state = "paw";
			}
		}
	}
} else {
	stopAnimations = true;
}

if (stopAnimations){
	image_index = 0;
	tailIndex = 0;
}
	
if (tailState == "sleep"){
	if(tailSleepTimer > 0){
		tailSleepTimer--;
	}else{
		tailSleepTimer = tailSleepTimerMax;
		tailState = "wag";
	}
} else if (tailState == "wag"){
	if(tailWagTimer > 0){
		tailWagTimer--;
	} else {
		if(tailFrames > 0){
			tailIndex += .20;
			tailFrames--;
		} else {
			tailWagTimer = tailWagTimerMax;
			tailFrames = tailFramesMax
			tailIndex = 0;
			tailState = "sleep";
		}
	}
}

if(state == "paw"){
	sprite_index = spr_woodman_enemy_03_paw;
} else if (state == "attack") {
	sprite_index = spr_woodman_enemy_03_attack;
}