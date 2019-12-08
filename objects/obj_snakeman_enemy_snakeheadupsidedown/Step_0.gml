centerx = x+sprite_width/2;
centery = y+sprite_height/2;
if(scr_inView()){
	visible = true;
} else{
	visible = false;
}

if(!scr_inView()){
	scr_goHome();
	return;
}

scr_hurtblink();
if(hp <= 0){
	scr_dropPickups(3);
	scr_explodeSmall();
	instance_destroy();
}
if(scr_freezeexit()) return;

if (place_meeting(x,y,obj_player))
	scr_hurt(damageC,0);

if(state == "sleep"){
	image_index = 0;
	if(scr_distanceToPlayer() < atkDistance){
		if(sleepTimer > 0){
			sleepTimer--;
		} else {
			sleepTimer = sleepTimerMax;
			state = "blink";
		}
	} else {
		sleepTimer = sleepTimerMax;
	}
} else if (state == "blink"){
	if(blinkTimer < blinkTimerMax/2)
		image_index = 0;
	else
		image_index = 1;
	if(blinkTimer > 0){
		blinkTimer--;
	} else {
		blinkTimer = blinkTimerMax;
		sideFacing = scr_playerSide();
		state = "shoot";
		//spawn projectile
		_projectile = instance_create_depth(shootOriginX,shootOriginY,depth+1,obj_snakeman_enemy_projectile);
		with(_projectile){
			zone = other.zone;
			spd = 5;
		}
	}
} else if (state == "shoot"){
	image_index = 2;
	if(shootTimer > 0){
		shootTimer--;
	} else {
		shootTimer = shootTimerMax;
		state = "sleep";
	}
}



if(sideFacing > 0){
	sprite_index = spr_snakeman_enemy_snakeheadrightupsidedown;
} else {
	sprite_index = spr_snakeman_enemy_snakeheadleftupsidedown;
}