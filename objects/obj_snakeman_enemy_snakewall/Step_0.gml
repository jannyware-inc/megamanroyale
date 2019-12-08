centerx = x+sprite_width/2;
centery = y+sprite_height/2;
if(scr_inZoneOrView()){
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
	scr_dropPickups(15);
	with(obj_snakeman_enemy_platform){
		if (zone == other.zone){
			stop = 1;
		}
	}
	scr_explodeBig();
	instance_destroy(wall1);
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
			state = "shoot";
			shootTimer = 0;
		}
	} else {
		sleepTimer = sleepTimerMax;
	}
} else if (state == "shoot"){
	image_index = 1;
	if(shootTimer > 0){
		shootTimer--;
	} else {
		shootTimer = shootTimerMax;
		if(bullets > 0){
			bullets--;
			//spawn projectile
			_projectile = instance_create_depth(shootOriginX,shootOriginY,depth+1,obj_snakeman_enemy_projectilebig);
			with(_projectile){
			zone = other.zone;
			spd = 5;
			}
		} else {
			bullets = BULLETSRANDOM;
			state = "sleep";
		}
	}
}

