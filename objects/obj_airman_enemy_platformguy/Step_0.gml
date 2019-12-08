if(!scr_inView()){
	visible = false;
} else {
	visible = true;
}

scr_hurtblink();
	

x = (platform.x + spriteOffsetX);
y = (platform.y + spriteOffsetY);
centerx = x + sprite_width/2;
centery = y;

if(!scr_inZoneAndView()){
	state = "sleep";
	sleepTimer = sleepTimerStart;
	return;
}

scr_mirror();

//hopHspd = abs(hopHspd) * sign(global.playerCenterx - (x+sprite_width/2));

if(hp <= 0){
	scr_explodeSmall();
	scr_dropPickups(5);
	instance_destroy();
}
if(scr_freezeexit()) return;

if (place_meeting(x,y,obj_player))
	scr_hurt(damageC,0);


if(state == "sleep"){
	if(sleepTimer > 0){
		sleepTimer--;
	} else {
		sleepTimer = sleepTimerMax;
		state = "attack";
		//spawn lightning
		if(mirror > 0){
			lightning = instance_create_depth(x,y,0,obj_airman_enemy_playformguy_lightning);
		} else {
			lightning = instance_create_depth(x+rightThrowOffset,y,0,obj_airman_enemy_playformguy_lightning);
		}
		with(lightning){
			hspd = other.mirror * hspd;
		}
	}
} else if(state == "attack"){
	if(attackTimer > 0){
		attackTimer--;
	} else {
		attackTimer = attackTimerMax;
		state = "sleep";
	}
} 

if(mirror > 0){
	if(state == "sleep"){
		sprite_index = spr_airman_enemy_platformguy;
	} else if(state == "attack"){
		sprite_index = spr_airman_enemy_platformguy_throw;
	}
} else {
	if(state == "sleep"){
		sprite_index = spr_airman_enemy_platformguymirror;
	} else if(state == "attack"){
		sprite_index = spr_airman_enemy_platformguy_throwmirror;
	}
}

centerx = x+sprite_width/2;
centery = y+sprite_height/2;