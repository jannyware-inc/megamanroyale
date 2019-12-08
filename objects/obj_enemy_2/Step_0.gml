centerx = x;
centery = y-sprite_height/2;
if(!scr_inView()){
	visible = false;
} else {
	visible = true;
}

if(!scr_inZoneOrView()){
	scr_goHome();
	sleepTimer = sleepTimerMax;
	state = "sleep";
	return;
}

scr_hurtblink();

if(hp <= 0){
	scr_dropPickups(3);
	scr_explodeSmall();
	instance_destroy();
}
if(scr_freezeexit()) return;
if(state == "sleep" and scr_distanceToPlayer() <= aRad){
	if(sleepTimer > 0)
		sleepTimer--;
	else{
		sleepTimer = sleepBase + random(sleepRandom);
		state = "wakeup";
		ricochet = 0;
	}
} else if (state == "wakeup"){
	if(wakeUpTimer > 0)
		wakeUpTimer--;
	else{
		wakeUpTimer = wakeUpTimerMax;
		state = "attack";
	}
} else if (state == "attack"){
	if(scr_distanceToPlayer() < dRad){		
		if (place_meeting(x,y,global.player)){
			scr_hurt(damageC,0);
			state = "retreat";
		} else{
			if (scr_distanceToPlayer() < swoopRad){			
				dir = point_direction(x,y,global.player.centerx,global.player.centery);		
			}else{
				if (abs(x - global.player.x) > abs(y - global.player.y))
					dir = point_direction(x,global.player.centery, global.player.centerx, global.player.centery); //flat line left or right
				else
					dir = point_direction(global.player.centerx,y, global.player.centerx, global.player.centery); //flat line up or down
			}

			len = spd;
			hspd = lengthdir_x(len,dir);
			vspd = lengthdir_y(len,dir);
			x += hspd;
			y += vspd;
		}
	} else { 
		state = "retreat";
	}
} else if (state == "retreat"){
	if(y > restY and !place_meeting(x,y,obj_wall)){
		y += -retreatSpd;
	} else {
		ricochet = 1;
		state = "sleep";
	}
}
	
		

if(state == "sleep"){
	sprite_index = spr_enemy_02_sleep;
	image_index = 0;
} else if (state == "wakeup") {
	sprite_index = spr_enemy_02_sleep;
	image_index = 1 + 4*((wakeUpTimerMax-wakeUpTimer)/wakeUpTimerMax);
}else if (state == "attack") {
	sprite_index = spr_enemy_02_flying;
}
